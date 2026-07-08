#!/usr/bin/env python3
"""
make_programs_v35.py

Read the original single-core sorting-network instr_rom.v,
extract all 521 compare-swap index pairs,
convert from 32-bit word-offset to 16-bit halfword-offset,
and distribute them round-robin across 4 cores.

Generates:
  programs/core_0.hex
  programs/core_1.hex
  programs/core_2.hex
  programs/core_3.hex

Each compare-swap = 5 ARM instructions:
  LDR  R0, [R7, #off_a]    ; load from global_rf[off_a/2]
  LDR  R1, [R7, #off_b]    ; load from global_rf[off_b/2]
  SUBS R2, R0, R1           ; compare, set flags
  STRMI R1, [R7, #off_a]   ; if R0 < R1, swap (MI = signed less-than)
  STRMI R0, [R7, #off_b]   ; NOP-like if no swap needed? Actually cc=MI
"""

import re
import os

def parse_instr_rom(filepath):
    """Extract all (off_a, off_b) pairs from instr_rom.v"""
    with open(filepath, 'r') as f:
        content = f.read()

    # Match: rom[N] = 32'hXXXXXXXX;
    pattern = r'rom\[\s*(\d+)\s*\]\s*=\s*32\'h([0-9A-Fa-f]{8});'
    matches = re.findall(pattern, content)

    # Build rom array
    rom = {}
    for idx_str, hex_val in matches:
        rom[int(idx_str)] = int(hex_val, 16)

    # Parse LDR instructions to get offset pairs
    # LDR format: 0xE5970xxx or 0xE5971xxx
    #   E5970000 = LDR R0, [R7, #0]
    #   E5971008 = LDR R1, [R7, #8]
    pairs = []
    max_idx = max(rom.keys()) if rom else 0

    i = 0
    while i <= max_idx:
        if i in rom and i+4 in rom:
            instr0 = rom[i]      # LDR R0, [R7, #off_a]
            instr1 = rom[i+1]    # LDR R1, [R7, #off_b]
            instr2 = rom[i+2]    # SUBS R2, R0, R1
            instr3 = rom[i+3]    # conditional STR
            instr4 = rom[i+4]    # conditional STR

            # Verify this is a compare-swap pattern
            # LDR: opcode 0xE59... or 0xE51... = LDR Rd, [Rn, #imm]
            is_ldr0 = (instr0 & 0xFFF00000) == 0xE5900000 or (instr0 & 0xFFF00000) == 0xE5100000
            is_ldr1 = (instr1 & 0xFFF00000) == 0xE5900000 or (instr1 & 0xFFF00000) == 0xE5100000
            # SUBS: 0xE050... = SUBS Rd, Rn, Rm
            is_subs = (instr2 & 0xFFF00000) == 0xE0500000

            if is_ldr0 and is_ldr1 and is_subs:
                off_a = instr0 & 0xFFF
                off_b = instr1 & 0xFFF
                pairs.append((off_a, off_b))
                i += 5
                continue
        i += 1

    return pairs


def encode_arm_instrs(off_a, off_b):
    """
    Generate 5 ARM instructions for a compare-swap.
    Uses signed comparison (MI = R0 < R1, i.e. signed less-than).
    This matches the original sorting program's behavior.

    For V3.5 16-bit global_rf: offset is halfword byte-offset (off*2).
    The ALU computes Rn + imm12 for the address; addr[6:1] indexes global_rf.
    """
    # LDR R0, [R7, #off_a]
    ldr0 = 0xE5970000 | (off_a & 0xFFF)
    # LDR R1, [R7, #off_b]
    ldr1 = 0xE5971000 | (off_b & 0xFFF)
    # SUBS R2, R0, R1  (set flags: N=1 if R0<R1 signed)
    subs = 0xE0502001
    # STRGT R1, [R7, #off_a]  (store R1 to off_a if R0 > R1 signed → swap)
    str_a = 0xC5871000 | (off_a & 0xFFF)
    # STRGT R0, [R7, #off_b]  (store R0 to off_b if R0 > R1 signed → swap)
    str_b = 0xC5870000 | (off_b & 0xFFF)

    return [ldr0, ldr1, subs, str_a, str_b]


def main():
    # Path to original instr_rom.v
    script_dir = os.path.dirname(os.path.abspath(__file__))
    src_rom = os.path.join(script_dir, '..', 'mcu_v3', 'rtl', 'instr_rom.v')

    if not os.path.exists(src_rom):
        # Try alternative paths
        src_rom = os.path.join(script_dir, '..', '..', 'mcu_v3', 'rtl', 'instr_rom.v')

    if not os.path.exists(src_rom):
        print(f"ERROR: Cannot find instr_rom.v at {src_rom}")
        print("Please run this script from mcu_v3_5/ or provide the correct path.")
        return

    print(f"Reading: {src_rom}")
    pairs = parse_instr_rom(src_rom)
    print(f"Found {len(pairs)} compare-swap pairs")

    if len(pairs) == 0:
        print("ERROR: No pairs found. Check the ROM format.")
        return

    # Convert offsets: original uses word-aligned byte offsets (step 4)
    # V3.5 uses halfword-aligned byte offsets (step 2)
    # So divide by 2: off_new = off_old / 2
    hw_pairs = [(a // 2, b // 2) for a, b in pairs]

    # Verify offsets are within range [0, 126] for 64-entry global_rf
    for a, b in hw_pairs:
        assert 0 <= a < 128, f"Offset {a} out of range"
        assert 0 <= b < 128, f"Offset {b} out of range"

    # Distribute round-robin across 4 cores
    NUM_CORES = 4
    core_programs = [[] for _ in range(NUM_CORES)]
    for idx, (a, b) in enumerate(hw_pairs):
        core_id = idx % NUM_CORES
        instrs = encode_arm_instrs(a, b)
        core_programs[core_id].extend(instrs)

    # Write .hex files
    out_dir = os.path.join(script_dir, 'programs')
    os.makedirs(out_dir, exist_ok=True)

    for core_id in range(NUM_CORES):
        prog = core_programs[core_id]
        out_path = os.path.join(out_dir, f'core_{core_id}.hex')
        with open(out_path, 'w') as f:
            for instr in prog:
                f.write(f'{instr:08X}\n')

        pc_end = len(prog) * 4  # 4 bytes per instruction
        print(f"  core_{core_id}.hex: {len(prog)} instructions, "
              f"DONE_PC = 0x{pc_end:08X}")

    print(f"\nFiles written to: {out_dir}")
    print("\nUpdate tb_top_v35_quad_core.v DONE_PC values:")
    for core_id in range(NUM_CORES):
        pc_end = len(core_programs[core_id]) * 4
        print(f"  DONE_PC{core_id} = 32'h{pc_end:08X};")


if __name__ == '__main__':
    main()

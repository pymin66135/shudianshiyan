#!/usr/bin/env python3
"""Generate sort8_u16_unsigned.hex for the V0 ARM A32 subset MCU.

Supported by the provided V0 MCU:
- MOV immediate imm8, rotate=0
- LDR/STR [Rn, #imm12]
- SUBS register, updates NZCV flags
- conditional STRHI for unsigned compare-and-swap
- B branch
"""
from pathlib import Path

COND = {
    "EQ": 0x0, "NE": 0x1, "CS": 0x2, "HS": 0x2, "CC": 0x3, "LO": 0x3,
    "MI": 0x4, "PL": 0x5, "VS": 0x6, "VC": 0x7, "HI": 0x8, "LS": 0x9,
    "GE": 0xA, "LT": 0xB, "GT": 0xC, "LE": 0xD, "AL": 0xE,
}

OPCODES = {
    "AND": 0b0000,
    "SUB": 0b0010,
    "ADD": 0b0100,
    "ORR": 0b1100,
    "MOV": 0b1101,
}


def dp_reg(op: str, rd: int, rn: int, rm: int, s: int = 0, cond: str = "AL") -> int:
    return (COND[cond] << 28) | (0 << 26) | (0 << 25) | (OPCODES[op] << 21) | (s << 20) | (rn << 16) | (rd << 12) | rm


def dp_imm(op: str, rd: int, rn: int, imm8: int, s: int = 0, cond: str = "AL") -> int:
    assert 0 <= imm8 <= 0xFF
    return (COND[cond] << 28) | (0 << 26) | (1 << 25) | (OPCODES[op] << 21) | (s << 20) | (rn << 16) | (rd << 12) | imm8


def mov_imm(rd: int, imm8: int, s: int = 0, cond: str = "AL") -> int:
    return dp_imm("MOV", rd, 0, imm8, s, cond)


def ldr_str(load: bool, rd: int, rn: int, imm12: int, cond: str = "AL") -> int:
    assert 0 <= imm12 <= 0xFFF
    # cond | 01 | I=0 | P=1 | U=1 | B=0 | W=0 | L | Rn | Rd | imm12
    return (COND[cond] << 28) | (0b01 << 26) | (1 << 24) | (1 << 23) | ((1 if load else 0) << 20) | (rn << 16) | (rd << 12) | imm12


def branch(pc: int, target: int, link: bool = False, cond: str = "AL") -> int:
    imm = (target - (pc + 8)) >> 2
    if imm < 0:
        imm &= 0xFFFFFF
    assert 0 <= imm <= 0xFFFFFF
    return (COND[cond] << 28) | (0b101 << 25) | ((1 if link else 0) << 24) | imm


COMPARATORS = [
    (0, 2), (1, 3), (4, 6), (5, 7),
    (0, 4), (1, 5), (2, 6), (3, 7),
    (0, 1), (2, 3), (4, 5), (6, 7),
    (2, 4), (3, 5),
    (1, 4), (3, 6),
    (1, 2), (3, 4), (5, 6),
]


def main() -> None:
    instrs = []
    asm_lines = []

    def emit(word: int, text: str) -> None:
        addr = len(instrs) * 4
        instrs.append(word)
        asm_lines.append(f"0x{addr:04X}:  {word:08X}    {text}")

    emit(mov_imm(7, 0), "MOV     R7, #0")

    for i, j in COMPARATORS:
        ai = i * 4
        aj = j * 4
        emit(ldr_str(True, 0, 7, ai),      f"LDR     R0, [R7, #{ai}]")
        emit(ldr_str(True, 1, 7, aj),      f"LDR     R1, [R7, #{aj}]")
        emit(dp_reg("SUB", 2, 0, 1, s=1), "SUBS    R2, R0, R1")
        emit(ldr_str(False, 1, 7, ai, cond="HI"), f"STRHI   R1, [R7, #{ai}]")
        emit(ldr_str(False, 0, 7, aj, cond="HI"), f"STRHI   R0, [R7, #{aj}]")

    done_pc = len(instrs) * 4
    emit(branch(pc=done_pc, target=done_pc), "done: B  done")

    out_dir = Path(__file__).resolve().parent
    (out_dir / "sort8_u16_unsigned.hex").write_text("\n".join(f"{x:08X}" for x in instrs) + "\n", encoding="utf-8")
    (out_dir / "sort8_u16_unsigned.lst").write_text("\n".join(asm_lines) + "\n", encoding="utf-8")
    print(f"Generated {len(instrs)} instructions")
    print(out_dir / "sort8_u16_unsigned.hex")
    print(out_dir / "sort8_u16_unsigned.lst")


if __name__ == "__main__":
    main()

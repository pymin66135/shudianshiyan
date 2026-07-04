#!/usr/bin/env python3
"""
make_opt_v35.py — V3.5 register-blocking optimized sort program generator

Strategy for N=64 across 4 cores:
  Phase 1 (intra-core): Each core sorts its own 16-element chunk
    using register-blocking Batcher sort in two batches of 8.
    This reduces global_rf traffic dramatically.

  Phase 2 (inter-core): Cross-core CAS pairs use LDR/STR
    through global_rf, round-robin distributed.

Output: programs/core_0.hex .. core_3.hex
Backup: programs_round_robin/ (original round-robin programs)
"""

import os

# ============================================================
# Batcher odd-even merge sort network generator
# ============================================================

def batcher_sort_pairs(n):
    """Generate all CAS pairs (a,b) with a<b for Batcher sort of size n."""
    if n <= 1:
        return []

    pairs = []

    def oddeven_merge(lo, n):
        """Odd-even merge of n elements starting at lo."""
        if n <= 1:
            return []
        result = []
        # find largest power of 2 less than n
        m = 1
        while m < n:
            m *= 2
        m //= 2
        for i in range(n - m):
            result.append((lo + i, lo + i + m))
        result.extend(oddeven_merge(lo, m))
        result.extend(oddeven_merge(lo + m, n - m))
        return result

    mid = n // 2
    pairs.extend(batcher_sort_pairs(mid))
    pairs.extend([(p[0] + mid, p[1] + mid) for p in batcher_sort_pairs(n - mid)])
    pairs.extend(oddeven_merge(0, n))
    return pairs


def cas_pairs_for_n(n):
    """Get CAS pairs and deduplicate while preserving order."""
    seen = set()
    result = []
    for a, b in batcher_sort_pairs(n):
        if a > b:
            a, b = b, a
        if (a, b) not in seen:
            seen.add((a, b))
            result.append((a, b))
    return result


# ============================================================
# ARM instruction encoding helpers
# ============================================================

def enc_ldr(rd, rn, offset):
    """LDR Rd, [Rn, #offset]  (cond=AL, pre-indexed, add, word)"""
    # 0xE5970000 = LDR with Rn=R7
    return 0xE5970000 | (rd << 12) | (offset & 0xFFF)


def enc_str_cond(rd, rn, offset, cond=0xE):
    """STRcc Rd, [Rn, #offset]"""
    return (cond << 28) | 0x05870000 | (rd << 12) | (offset & 0xFFF)


def enc_subs(rd, rn, rm):
    """SUBS Rd, Rn, Rm"""
    return 0xE0500000 | (rn << 16) | (rd << 12) | (rm & 0xF)


def enc_movcc(rd, rm, cond=0xC):
    """MOVcc Rd, Rm  (default cond=GT for signed-greater-than swap)"""
    return (cond << 28) | 0x01A00000 | (rd << 12) | (rm & 0xF)


# ============================================================
# Register-blocking CAS for N elements (N <= 8, uses R0..R7)
# ============================================================

def reg_block_cas_batch(pairs):
    """
    Generate register-to-register CAS instructions for a list of pairs.
    Each CAS = 4 instructions: SUBS, MOVGT, MOVGT, MOVGT.
    Uses R14 as temp register.
    """
    T = 14  # temp register
    instrs = []
    for a, b in pairs:
        instrs.append(enc_subs(T, a, b))    # SUBS R14, Ra, Rb
        instrs.append(enc_movcc(T, a))      # MOVGT R14, Ra
        instrs.append(enc_movcc(a, b))      # MOVGT Ra, Rb
        instrs.append(enc_movcc(b, T))      # MOVGT Rb, R14
    return instrs


def load_batch(start_idx, n):
    """LDR R0..R(N-1) from global_rf start_idx..start_idx+n-1 (halfword offsets)."""
    return [enc_ldr(i, 7, (start_idx + i) * 2) for i in range(n)]


def store_batch(start_idx, n):
    """STR R0..R(N-1) to global_rf start_idx..start_idx+n-1."""
    return [enc_str_cond(i, 7, (start_idx + i) * 2, cond=0xE) for i in range(n)]


# ============================================================
# LDR/STR-based CAS for two global_rf entries (cross-core style)
# ============================================================

def gprf_cas(a_idx, b_idx):
    """5-instruction CAS through global_rf: LDR, LDR, SUBS, STRGT, STRGT."""
    return [
        enc_ldr(0, 7, a_idx * 2),           # LDR R0, [R7, #off_a]
        enc_ldr(1, 7, b_idx * 2),           # LDR R1, [R7, #off_b]
        enc_subs(2, 0, 1),                   # SUBS R2, R0, R1
        enc_str_cond(1, 7, a_idx * 2, 0xC), # STRGT R1, [R7, #off_a]
        enc_str_cond(0, 7, b_idx * 2, 0xC), # STRGT R0, [R7, #off_b]
    ]


# ============================================================
# Main generator
# ============================================================

def main():
    N_TOTAL = 64
    N_CORES = 4
    N_PER_CORE = N_TOTAL // N_CORES   # 16
    BATCH = 8

    core_instrs = [[] for _ in range(N_CORES)]

    # --------------------------------------------------------
    # Phase 1: Intra-core Batcher sort of 16 elements each
    #   Batch 0: load 8, sort in regs, store 8
    #   Batch 1: load 8, sort in regs, store 8
    #   Merge:  odd-even merge of two sorted 8s via global_rf
    # --------------------------------------------------------
    print("Phase 1: Intra-core 16-element sort (register blocking)...")
    pairs_16 = cas_pairs_for_n(16)

    for c in range(N_CORES):
        base = c * N_PER_CORE
        p = core_instrs[c]

        # Batch 0: global_rf[base .. base+7]
        p.extend(load_batch(base, BATCH))
        p.extend(reg_block_cas_batch(cas_pairs_for_n(BATCH)))
        p.extend(store_batch(base, BATCH))

        # Batch 1: global_rf[base+8 .. base+15]
        p.extend(load_batch(base + BATCH, BATCH))
        p.extend(reg_block_cas_batch(cas_pairs_for_n(BATCH)))
        p.extend(store_batch(base + BATCH, BATCH))

        # Merge two sorted 8s -> sorted 16 (via global_rf)
        for a, b in pairs_16:
            p.extend(gprf_cas(base + a, base + b))

        print(f"  core_{c}: {len(p)} instrs (intra-core)")

    # --------------------------------------------------------
    # Phase 2: Cross-core CAS from the full 64-element network
    #   Only pairs that cross core boundaries.
    #   Distributed round-robin.
    # --------------------------------------------------------
    print("\nPhase 2: Cross-core CAS (LDR/STR through global_rf)...")
    pairs_64 = cas_pairs_for_n(N_TOTAL)
    cross_pairs = [(a, b) for a, b in pairs_64
                   if (a // N_PER_CORE) != (b // N_PER_CORE)]

    print(f"  Batcher-64 total CAS: {len(pairs_64)}")
    print(f"  Intra-core CAS:      {len(pairs_64) - len(cross_pairs)}")
    print(f"  Cross-core CAS:      {len(cross_pairs)}")

    for idx, (a, b) in enumerate(cross_pairs):
        core_id = idx % N_CORES
        core_instrs[core_id].extend(gprf_cas(a, b))

    for c in range(N_CORES):
        print(f"  core_{c}: {len(core_instrs[c])} total instrs")

    # --------------------------------------------------------
    # Write output
    # --------------------------------------------------------
    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)),
                           '..', 'programs')
    os.makedirs(out_dir, exist_ok=True)

    print(f"\nWriting to: {out_dir}")
    done_pcs = []
    for c in range(N_CORES):
        path = os.path.join(out_dir, f'core_{c}.hex')
        with open(path, 'w') as f:
            for instr in core_instrs[c]:
                f.write(f'{instr:08X}\n')
        dpc = len(core_instrs[c]) * 4
        done_pcs.append(dpc)
        print(f"  core_{c}.hex: {len(core_instrs[c])} instrs, "
              f"DONE_PC = 0x{dpc:08X}")

    print(f"\nUpdate tb_top_v35_quad_core.v DONE_PC values:")
    for c, dpc in enumerate(done_pcs):
        print(f"  DONE_PC_CORE{c} = 32'h{dpc:08X};")

    print("\nOriginal programs backed up at: programs_round_robin/")


if __name__ == '__main__':
    main()

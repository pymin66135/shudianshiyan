#!/usr/bin/env python3
"""
========================================================================
V5.0 16-Core Sort Program Generator (纯 global_rf)
========================================================================
16核架构，每核4元素。Phase1核内Batcher-4，Phase2跨核归并+16核锁步。
========================================================================
"""

import os


def batcher_sort(lo, n):
    if n <= 1: return []
    m = n // 2
    p = []
    p.extend(batcher_sort(lo, m))
    p.extend(batcher_sort(lo + m, m))
    p.extend(batcher_merge(lo, n, 1))
    return p


def batcher_merge(lo, n, r):
    m = r * 2
    p = []
    if m < n:
        p.extend(batcher_merge(lo, n, m))
        p.extend(batcher_merge(lo + r, n, m))
        for i in range(lo + r, lo + n - r, m):
            p.append((i, i + r))
    else:
        p.append((lo, lo + r))
    return p


def enc_ldr(rd, rn, offset):
    return 0xE5900000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)


def enc_str_cond(rd, rn, offset, cond=0xE):
    return (cond << 28) | 0x05800000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)


def enc_subs(rd, rn, rm):
    return 0xE0500000 | (rn << 16) | (rd << 12) | (rm & 0xF)


def gprf_cas(a_idx, b_idx):
    return [
        enc_ldr(0, 7, a_idx * 2),
        enc_ldr(1, 7, b_idx * 2),
        enc_subs(2, 0, 1),
        enc_str_cond(1, 7, a_idx * 2, 0xC),
        enc_str_cond(0, 7, b_idx * 2, 0xC),
    ]


def gprf_cas_dummy():
    return [0xE1A00000] * 5


def main():
    N_TOTAL = 64
    N_CORES = 16

    core_instrs = [[] for _ in range(N_CORES)]

    # Single phase: full Batcher-64 network with depth layering
    # No Phase1/Phase2 split — avoids the duplicate-removal bug
    print("V5.0 16-Core: Full Batcher-64 Network (depth-layered)")
    all_pairs = batcher_sort(0, N_TOTAL)
    print(f"  Total CAS pairs: {len(all_pairs)}")

    depth = {i: 0 for i in range(N_TOTAL)}
    layers = {}
    for a, b in all_pairs:
        d = max(depth[a], depth[b]) + 1
        depth[a] = depth[b] = d
        layers.setdefault(d, []).append((a, b))
    print(f"  Topology layers: {len(layers)}")

    for d in sorted(layers.keys()):
        lp = layers[d]
        for i in range(0, len(lp), N_CORES):
            for c in range(N_CORES):
                if i + c < len(lp):
                    a, b = lp[i + c]
                    core_instrs[c].extend(gprf_cas(a, b))
                else:
                    core_instrs[c].extend(gprf_cas_dummy())

    for c in range(N_CORES):
        print(f"  core_{c:02d}: {len(core_instrs[c])} 条指令")

    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "programs")
    os.makedirs(out_dir, exist_ok=True)
    print(f"\n写入: {out_dir}")
    done_pcs = []
    for c in range(N_CORES):
        path = os.path.join(out_dir, f"core_{c:02d}.hex")
        with open(path, "w") as f:
            for instr in core_instrs[c]:
                f.write(f"{instr:08X}\n")
        dpc = len(core_instrs[c]) * 4
        done_pcs.append(dpc)
        print(f"  core_{c:02d}: {len(core_instrs[c])} 条, DONE_PC=0x{dpc:08X}")

    print("\nDONE_PC:")
    for c, dpc in enumerate(done_pcs):
        print(f"  DONE_PC_CORE{c:02d} = 32'h{dpc:08X};")


if __name__ == "__main__":
    main()

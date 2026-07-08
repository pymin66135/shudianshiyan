#!/usr/bin/env python3
"""
V5.2 32-Core Safe-NOP Program Generator
- 64 signed inputs in global_rf[0..63]
- Batcher-64 network: 543 compare-swap pairs, 21 topology layers
- 32 cores execute one layer per 6-instruction slot: LDR/LDR/CMP/STRGT/STRGT/NOP
- Dummy slots are filled with NOP so every core has identical DONE_PC.
"""
import os

NOP = 0xE1A00000

def batcher_sort(lo, n):
    if n <= 1: return []
    m = n // 2
    return batcher_sort(lo, m) + batcher_sort(lo + m, m) + batcher_merge(lo, n, 1)

def batcher_merge(lo, n, r):
    m = r * 2
    p = []
    if m < n:
        p += batcher_merge(lo, n, m)
        p += batcher_merge(lo + r, n, m)
        for i in range(lo + r, lo + n - r, m):
            p.append((i, i + r))
    else:
        p.append((lo, lo + r))
    return p

def enc_ldr(rd, rn, offset):
    return 0xE5900000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)

def enc_str_cond(rd, rn, offset, cond=0xE):
    return (cond << 28) | 0x05800000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)

def enc_cmp(rn, rm):
    return 0xE1500000 | (rn << 16) | (rm & 0xF)

def gprf_cas(a_idx, b_idx):
    return [
        enc_ldr(0, 7, a_idx * 2),
        enc_ldr(1, 7, b_idx * 2),
        enc_cmp(0, 1),
        enc_str_cond(1, 7, a_idx * 2, 0xC),
        enc_str_cond(0, 7, b_idx * 2, 0xC),
    ]

def main():
    n_total = 64
    n_cores = 32
    safe_slot_gap = 1
    pairs = batcher_sort(0, n_total)
    depth = {i: 0 for i in range(n_total)}
    layers = {}
    for a, b in pairs:
        d = max(depth[a], depth[b]) + 1
        depth[a] = depth[b] = d
        layers.setdefault(d, []).append((a, b))

    core_instrs = [[] for _ in range(n_cores)]
    for d in sorted(layers.keys()):
        lp = layers[d]
        assert len(lp) <= n_cores
        for c in range(n_cores):
            if c < len(lp):
                core_instrs[c].extend(gprf_cas(*lp[c]))
            else:
                core_instrs[c].extend([NOP] * 5)
            core_instrs[c].extend([NOP] * safe_slot_gap)

    out_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'programs')
    os.makedirs(out_dir, exist_ok=True)
    print(f"V5.2 32-Core: Batcher-64 {len(pairs)} CAS, {len(layers)} layers")
    for c, prog in enumerate(core_instrs):
        path = os.path.join(out_dir, f'core_{c:02d}.hex')
        with open(path, 'w') as f:
            for instr in prog:
                f.write(f'{instr:08X}\n')
        print(f"  core_{c:02d}: {len(prog)} instr, DONE_PC=0x{len(prog)*4:08X}")

if __name__ == '__main__':
    main()

#!/usr/bin/env python3
"""
========================================================================
V3.7 Simplified Sort Program Generator (纯 global_rf 方案)
========================================================================
设计理念:
  - 彻底移除寄存器分块(register-blocking)逻辑，Phase 1 和 Phase 2 统一
    使用 5 指令 gprf_cas (LDR/LDR/SUBS/STRGT/STRGT)，代码量减少 60%+
  - 性能代价: +6 周期 (+0.9%)，几乎可忽略

程序结构:
1. Batcher 排序网络生成器 (batcher_sort / batcher_merge)
2. ARM 指令编码器 (enc_ldr / enc_str_cond / enc_subs)
3. 全局 RF CAS 生成器 (gprf_cas / gprf_cas_dummy)
4. 主调度:
   Phase 1: 每个核独立对其 16 个元素执行 batcher_sort(0,16)
            通过 gprf_cas，无跨核依赖，无需锁步
   Phase 2: 提取 Batcher-64 的跨核归并对 (batcher_merge(0,32) +
            batcher_merge(32,32) + batcher_merge(0,64))
            按拓扑深度分层，NOP 补齐实现多核锁步屏障
========================================================================
"""

import os


# ============================================================
# 1. Batcher 奇偶归并排序网络生成器
# ============================================================
def batcher_sort(lo, n):
    """生成 Batcher 排序网络的完整 CAS 对序列."""
    if n <= 1:
        return []
    m = n // 2
    p = []
    p.extend(batcher_sort(lo, m))
    p.extend(batcher_sort(lo + m, m))
    p.extend(batcher_merge(lo, n, 1))
    return p


def batcher_merge(lo, n, r):
    """生成 Batcher 奇偶归并网络的 CAS 对序列."""
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


# ============================================================
# 2. ARM 指令编码器
# ============================================================
def enc_ldr(rd, rn, offset):
    """LDR Rd, [Rn, #+offset]  (pre-indexed, add, word)"""
    return 0xE5900000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)


def enc_str_cond(rd, rn, offset, cond=0xE):
    """STR{cond} Rd, [Rn, #+offset]"""
    return (cond << 28) | 0x05800000 | (rn << 16) | (rd << 12) | (offset & 0xFFF)


def enc_subs(rd, rn, rm):
    """SUBS Rd, Rn, Rm"""
    return 0xE0500000 | (rn << 16) | (rd << 12) | (rm & 0xF)


# ============================================================
# 3. 全局 RF CAS 操作 (统一接口)
# ============================================================
def gprf_cas(a_idx, b_idx):
    """
    5 指令 CAS through global_rf:
      LDR R0, [R7, #off_a]
      LDR R1, [R7, #off_b]
      SUBS R2, R0, R1
      STRGT R1, [R7, #off_a]
      STRGT R0, [R7, #off_b]
    """
    return [
        enc_ldr(0, 7, a_idx * 2),
        enc_ldr(1, 7, b_idx * 2),
        enc_subs(2, 0, 1),
        enc_str_cond(1, 7, a_idx * 2, 0xC),
        enc_str_cond(0, 7, b_idx * 2, 0xC),
    ]


def gprf_cas_dummy():
    """NOP 补齐, 5 条 MOV R0,R0, 保证多核锁步."""
    return [0xE1A00000] * 5


# ============================================================
# 4. 主程序
# ============================================================
def main():
    N_TOTAL = 64
    N_CORES = 4
    N_PER_CORE = N_TOTAL // N_CORES  # 16

    core_instrs = [[] for _ in range(N_CORES)]

    # --------------------------------------------------------
    # Phase 1: 核内 16 元素排序 (纯 global_rf, 无竞态)
    #   每个核仅访问自己的 [base .. base+15] 区间
    # --------------------------------------------------------
    print("Phase 1: 核内 Batcher-16 排序 (纯 global_rf CAS)")
    pairs_16 = batcher_sort(0, N_PER_CORE)

    for c in range(N_CORES):
        base = c * N_PER_CORE
        p = core_instrs[c]
        for a, b in pairs_16:
            p.extend(gprf_cas(base + a, base + b))
        print(f"  core_{c}: {len(p)} 条指令 ({len(pairs_16)} CAS)")

    # --------------------------------------------------------
    # Phase 2: 跨核归并 (拓扑深度分层 + 锁步屏障)
    #   提取 Batcher-64 中 Phase 1 未覆盖的归并层级
    # --------------------------------------------------------
    print("\nPhase 2: 跨核归并 (深度分层 + NOP 锁步)")
    phase2_pairs = (
        batcher_merge(0, 32, 1)
        + batcher_merge(32, 32, 1)
        + batcher_merge(0, 64, 1)
    )

    # 拓扑深度分析: 每个元素索引跟踪其被修改的"深度"
    depth = {i: 0 for i in range(N_TOTAL)}
    layers = {}
    for a, b in phase2_pairs:
        d = max(depth[a], depth[b]) + 1
        depth[a] = depth[b] = d
        layers.setdefault(d, []).append((a, b))

    print(f"  跨核 CAS 总数: {len(phase2_pairs)}")
    print(f"  拓扑层数: {len(layers)}")

    # 按层级分发: 每层内以 4 对为一组轮询分配, 不足则 NOP 补齐
    phase2_start = [len(p) for p in core_instrs]
    for d in sorted(layers.keys()):
        layer_pairs = layers[d]
        for i in range(0, len(layer_pairs), N_CORES):
            for c in range(N_CORES):
                if i + c < len(layer_pairs):
                    a, b = layer_pairs[i + c]
                    core_instrs[c].extend(gprf_cas(a, b))
                else:
                    core_instrs[c].extend(gprf_cas_dummy())

    for c in range(N_CORES):
        added = len(core_instrs[c]) - phase2_start[c]
        print(f"  core_{c}: +{added} 条 (Phase2), 总计 {len(core_instrs[c])} 条")

    # --------------------------------------------------------
    # 输出 hex 文件
    # --------------------------------------------------------
    out_dir = os.path.join(
        os.path.dirname(os.path.abspath(__file__)), "..", "programs"
    )
    os.makedirs(out_dir, exist_ok=True)

    print(f"\n写入 hex 到: {out_dir}")
    done_pcs = []
    for c in range(N_CORES):
        path = os.path.join(out_dir, f"core_{c}.hex")
        with open(path, "w") as f:
            for instr in core_instrs[c]:
                f.write(f"{instr:08X}\n")
        dpc = len(core_instrs[c]) * 4
        done_pcs.append(dpc)
        print(f"  core_{c}.hex: {len(core_instrs[c])} 条指令, DONE_PC = 0x{dpc:08X}")

    print("\n更新 tb_top_v35_quad_core.v 中的 DONE_PC:")
    for c, dpc in enumerate(done_pcs):
        print(f"  DONE_PC_CORE{c} = 32'h{dpc:08X};")


if __name__ == "__main__":
    main()

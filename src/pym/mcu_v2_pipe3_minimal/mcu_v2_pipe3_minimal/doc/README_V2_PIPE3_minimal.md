# README_V2_PIPE3_minimal

## 1. 版本目标

本版本只实现一件事：

> 在 V1 external wrapper 不变的前提下，将 V1 单周期 `mcu_top` 替换为最小可行三级流水 `mcu_top`。

本版本不是 speed 终版，也不是 efficiency 终版。它是后续 speed / efficiency 两条路线都可复用的基础微结构版本。

---

## 2. 已确认约束

| 项目 | 选择 |
|---|---|
| `top.v` | 保持不变 |
| `data_mem` | 保持 V1 组合读、同步写 |
| `debug_pc` | 使用 WB/提交阶段 PC |
| 指令集 | 只保证 V1 当前 ARM A32 子集 |
| 新指令 | 不新增 |
| 多核 | 不做 |
| 双 ALU / 双发射 | 不做 |
| 分支预测 | 不做 |

---

## 3. 流水线划分

```text
Stage 1: IF
  - PC register
  - instruction ROM asynchronous read
  - generate PC+4 / PC+8

Stage 2: ID/EX/MEM
  - decode instruction
  - condition check
  - register file read
  - Operand2 decode
  - ALU operation
  - data_mem read/write
  - branch target calculation

Stage 3: WB
  - register write-back
  - flags commit
  - debug output commit
```

对应文件：

```text
rtl/mcu_top.v
```

原 V1 单周期版本保存在：

```text
rtl/mcu_top_v1_single_cycle.v
```

---

## 4. Hazard 处理

### 4.1 EX/WB forwarding

相邻数据相关指令通过 EX/WB 前递解决：

```asm
ADD R1, R2, R3
SUB R4, R1, R5
```

如果 WB 阶段要写的寄存器等于当前 EX 阶段读取的源寄存器，则直接使用 `ex_wb_reg_wdata`。

### 4.2 LDR-use

当前 V1 `data_mem` 是组合读：

```verilog
assign read_data = mem[word_index];
```

因此第一版不插入 load-use stall，依靠 EX/WB forwarding 处理：

```asm
LDR R0, [R7, #0]
CMP R0, R1
```

如果后续把 `data_mem` 改为 Vivado BRAM 同步读，必须增加 load-use stall。

### 4.3 Flags forwarding

排序程序中常见：

```asm
SUBS R5, R3, R4
BLE  no_swap
```

`BLE` 必须看到上一条 `SUBS` 新生成的 NZCV。当前版本用：

```verilog
flags_for_cond = ex_wb_flag_write ? ex_wb_flags : flags;
```

解决 flags hazard。

### 4.4 Branch flush

分支在 Stage 2 判断。若 branch taken：

```text
PC = branch_target
IF/ID = invalid bubble
```

本版本不做分支预测。

---

## 5. `debug_pc` 语义变化

V1 单周期：

```text
debug_pc = 当前 PC
```

V2 PIPE3：

```text
debug_pc = WB/提交阶段 PC
```

这意味着 `top.v` 中：

```verilog
assign mcu_done = (debug_pc[31:2] == DONE_PC[31:2]);
```

会在 DONE 指令进入提交阶段后触发。相比 IF 阶段 PC，这更稳，但会比取到 DONE 指令晚若干拍。

---

## 6. 第一版不做的内容

```text
不做五级流水
不做分支预测
不做多核
不做双 ALU / 双发射
不做多端口 RF
不新增 ARM 外指令
不把 data_mem 改成同步 BRAM
不改 top.v 的 LOAD / RUN / WRITE / DONE 流程
```

---

## 7. 仿真建议

推荐先跑：

```text
tb/tb_top_v2_pipe3_full64.v
```

观察：

```text
state
cnt_test
debug_pc
debug_instr
debug_reg_write
debug_reg_waddr
debug_reg_wdata
debug_mem_write
debug_mem_addr
debug_mem_wdata
debug_flags
debug_unsupported
verify_RAM[0..63]
```

通过标准：

```text
1. top 进入 DONE；
2. cnt_test 非 0；
3. verify_RAM[0..63] signed 升序；
4. debug_unsupported 不应异常拉高；
5. Vivado 综合、实现通过；
6. WNS > 0。
```

---

## 8. 与 V1 baseline 对比表

上板/实现后建议记录：

| 指标 | V1 单周期 | V2 PIPE3 |
|---|---:|---:|
| cnt_test | 待填 | 待填 |
| clock period | 待填 | 待填 |
| total_time = cnt_test × period | 待填 | 待填 |
| LUT | 待填 | 待填 |
| FF | 待填 | 待填 |
| BRAM | 待填 | 待填 |
| WNS | 待填 | 待填 |
| resource = 6×LUT + 10×FF | 待填 | 待填 |

只有当 `total_time` 或 `speed/resource` 比 V1 更好时，才能说明三级流水对对应榜单有正收益。


## Vivado 工程添加说明

可以直接添加 `rtl/` 目录下所有 `.v` 文件。当前三级流水 core 的模块名是 `mcu_top`；原 V1 单周期 core 备份文件 `mcu_top_v1_single_cycle.v` 的模块名已改为 `mcu_top_v1_single_cycle`，不会造成重复模块定义。

Design Top 设置为 `top`，Simulation Top 设置为 `tb_top_v2_pipe3_full64`。

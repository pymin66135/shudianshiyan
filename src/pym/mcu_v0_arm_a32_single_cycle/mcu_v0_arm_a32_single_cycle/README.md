# MCU V0：ARM A32 32 位单周期简易 MCU（仿真版）

本项目是课程设计前期理解型原型：使用 ARM A32 32 位指令字段，实现一个可仿真的单周期 MCU。

## 1. 支持范围

V0 支持：

- `ADD Rd, Rn, Rm` / `ADD Rd, Rn, #imm8`
- `SUB Rd, Rn, Rm` / `SUB Rd, Rn, #imm8`
- `AND Rd, Rn, Rm` / `AND Rd, Rn, #imm8`
- `ORR Rd, Rn, Rm` / `ORR Rd, Rn, #imm8`
- `MOV Rd, Rm` / `MOV Rd, #imm8`
- `LDR Rd, [Rn, #imm12]`
- `STR Rd, [Rn, #imm12]`
- `B label`
- `BL label`，只验证跳转与 `R14 = PC + 4`，暂不支持 `BX LR` 返回

V0 不支持 Thumb、异常/中断、完整 CPSR、完整 barrel shifter、立即数旋转、byte/halfword 访存、多周期/流水线、乘法器。

## 2. 目录结构

```text
mcu_v0_arm_a32_single_cycle/
├── rtl/
│   ├── mcu_top.v
│   ├── pc_reg.v
│   ├── instr_rom.v
│   ├── control_unit.v
│   ├── cond_unit.v
│   ├── reg_file.v
│   ├── alu.v
│   ├── operand2_decode.v
│   ├── data_mem.v
│   └── branch_unit.v
├── tb/
│   └── mcu_top_tb.v
├── program/
│   ├── program.hex
│   └── README_program.md
├── scripts/
│   └── make_program.py
└── doc/
    └── MCU_V0_ARM_A32_single_cycle_design.md
```

## 3. Vivado 仿真使用方法

### 3.1 新建工程

1. 打开 Vivado。
2. 点击 `Create Project`。
3. Project name 建议填写：`mcu_v0_arm_a32_single_cycle`。
4. Project Type 选择 `RTL Project`。
5. 勾选或不勾选 `Do not specify sources at this time` 都可以。初学者建议不勾选，直接下一步添加文件。
6. 选择任意可用 FPGA 器件即可，因为 V0 只做行为仿真，不上板。

### 3.2 添加 RTL 源文件

在 `Add Sources` 页面选择 `Add or create design sources`，加入 `rtl/` 下所有 `.v` 文件：

```text
rtl/mcu_top.v
rtl/pc_reg.v
rtl/instr_rom.v
rtl/control_unit.v
rtl/cond_unit.v
rtl/reg_file.v
rtl/alu.v
rtl/operand2_decode.v
rtl/data_mem.v
rtl/branch_unit.v
```

添加后，在 Sources 面板中确认 `mcu_top.v` 是设计顶层。如果不是，右键 `mcu_top`，选择 `Set as Top`。

### 3.3 添加仿真文件

选择 `Add Sources` → `Add or create simulation sources`，加入：

```text
tb/mcu_top_tb.v
```

添加后，在 Simulation Sources 中右键 `mcu_top_tb`，选择 `Set as Top`。

### 3.4 运行仿真

1. 左侧 Flow Navigator 选择 `Run Simulation`。
2. 点击 `Run Behavioral Simulation`。
3. 等待 xsim 打开。
4. 在 Tcl Console 或仿真输出窗口里查找：

```text
ALL TESTS PASSED.
```

如果看到这行，说明 V0 默认程序通过。

### 3.5 查看波形

建议把这些信号加入波形窗口：

```text
debug_pc
debug_instr
debug_reg_write
debug_reg_waddr
debug_reg_wdata
debug_mem_write
debug_mem_addr
debug_mem_wdata
debug_alu_result
debug_flags
debug_unsupported
```

观察重点：

- 普通指令时 `debug_pc` 每周期 +4。
- `B` 指令从 PC=56 跳到 PC=68。
- `BL` 指令从 PC=72 跳到 PC=84，同时写 `R14 = 76`。
- `STR` 指令时 `debug_mem_write = 1`。
- 不应出现 `debug_unsupported = 1`。

## 4. 关于 program.hex

默认 testbench 使用 `instr_rom.v` 内置程序，因此不需要处理 Vivado 相对路径问题。

如果想改为从 `program/program.hex` 加载，请修改 `tb/mcu_top_tb.v` 中的参数：

```verilog
.PROGRAM_FROM_FILE(0)
```

改为：

```verilog
.PROGRAM_FROM_FILE(1)
```

并确保 `program.hex` 在 Vivado 仿真工作目录中，或把 `PROGRAM_FILE` 改成绝对路径。

## 5. 默认测试程序预期结果

仿真结束后 testbench 会检查：

```text
R0  = 5
R1  = 3
R2  = 8
R3  = 2
R4  = 1
R5  = 7
R6  = 8
R7  = 0
R8  = 12
R9  = 7
R10 = 0
R11 = 12
R14 = 76

mem[0] = 8
mem[1] = 2
mem[2] = 1
mem[3] = 7
mem[4] = 12
mem[5] = 12
mem[6] = 76
```

## 6. 推荐写代码/改代码顺序

如果你们后续要自己手写或扩展代码，建议顺序是：

1. `pc_reg.v`
2. `instr_rom.v`
3. `reg_file.v`
4. `alu.v`
5. `operand2_decode.v`
6. `control_unit.v`
7. `data_mem.v`
8. `branch_unit.v`
9. `cond_unit.v`
10. `mcu_top.v`
11. `mcu_top_tb.v`

任何端口变化都先改 `doc/MCU_V0_ARM_A32_single_cycle_design.md`，再改 RTL。

## 7. 下一步扩展建议

V0 跑通后，下一步建议不是直接做 FFT，而是先扩展：

1. `CMP` 或 `SUBS`。
2. `BEQ/BNE/BLT/BGE` 等条件分支。
3. 8 个数的小规模排序仿真。
4. 再考虑课程验收用的 `test_ROM / verify_RAM / cnt_test` 接口。

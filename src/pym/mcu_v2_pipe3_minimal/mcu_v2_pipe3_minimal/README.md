# MCU V2 PIPE3 Minimal

这是基于 V1 external wrapper 的**最小可行三级流水版本**。

核心原则：

1. `top.v` 保持不变；
2. `data_mem` 保持 V1 的组合读、同步写；
3. `debug_pc` 改为 WB/提交阶段 PC；
4. 只保证 V1 当前 ARM A32 子集，不新增指令；
5. 只替换 MCU core：新的 `rtl/mcu_top.v` 是三级流水版本；原 V1 单周期 core 已备份为 `rtl/mcu_top_v1_single_cycle.v`。

## 目录结构

```text
mcu_v2_pipe3_minimal/
├── README.md
├── sort64_signed.hex
├── doc/
│   ├── README_V1_external_wrapper.md
│   └── README_V2_PIPE3_minimal.md
├── rtl/
│   ├── top.v                       # V1 wrapper，保持不变
│   ├── mcu_top.v                   # V2 三级流水 core，模块名仍为 mcu_top
│   ├── mcu_top_v1_single_cycle.v   # 原 V1 单周期 core 备份
│   ├── pc_reg.v
│   ├── instr_rom.v
│   ├── control_unit.v
│   ├── cond_unit.v
│   ├── reg_file.v
│   ├── alu.v
│   ├── operand2_decode.v
│   ├── data_mem.v
│   ├── branch_unit.v
│   └── cnt_test.v
└── tb/
    ├── tb_top_v1_smoke.v
    └── tb_top_v2_pipe3_full64.v
```

## Vivado 使用方式

1. 新建 RTL Project。
2. 添加 `rtl/*.v` 为 Design Sources。
3. 设置 `top` 为 design top。
4. 添加 `tb/tb_top_v2_pipe3_full64.v` 为 Simulation Sources。
5. 设置 `tb_top_v2_pipe3_full64` 为 simulation top。
6. Run Behavioral Simulation。

仿真时请确认 `sort64_signed.hex` 能被 xsim 找到。若 `$readmemh` 找不到文件，请把 testbench 里的：

```verilog
.PROGRAM_FILE("sort64_signed.hex")
```

改为你本地的绝对路径，例如：

```verilog
.PROGRAM_FILE("D:/your_path/mcu_v2_pipe3_minimal/sort64_signed.hex")
```

## 重要说明

当前版本是**代码级最小可行方案**，用于你们本地 Vivado 进一步验证和迭代。由于这里不能运行 Vivado/xsim，我没有声称它已经通过综合、实现或上板。你们需要在 `xc7k160tffg676-2` 工程里实测：

- full64 signed 仿真是否 PASS；
- `cnt_test` 是否正常计数；
- `debug_pc` 是否按 WB 阶段进入 `DONE_PC`；
- WNS 是否为正；
- LUT / FF / BRAM 资源变化。


## Vivado 使用提醒

设计源文件建议加入 `rtl/` 下所有 Verilog 文件。`mcu_top.v` 是三级流水 core；`mcu_top_v1_single_cycle.v` 已改名为备份模块 `mcu_top_v1_single_cycle`，不会与当前 `mcu_top` 冲突。

Vivado 工程中：

- Design Top 设为 `top`；
- Simulation Top 设为 `tb_top_v2_pipe3_full64`；
- 如果 `sort64_signed.hex` 找不到，把 testbench/top 参数里的 `PROGRAM_FILE` 改成本地绝对路径。

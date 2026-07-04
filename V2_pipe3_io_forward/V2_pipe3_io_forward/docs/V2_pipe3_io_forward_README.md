# V2_pipe3_io_forward_180 README

## 1. 版本名称

`V2_pipe3_io_forward_180`

## 2. 基线

基线版本为 `P4_sort_opt_pipe3`。本版本复制到：

`C:\Users\15756\Desktop\mcupipe3\V2_pipe3_io_forward`

当前确认指标：

- `cnt_test = 2739`
- `frequency = 180 MHz`
- `total_time ~= 15.22 us`

## 3. 优化内容

- `test_ROM` 装载流水化：原 P4 的 LOAD 状态机是 `ST_LOAD_REQ -> ST_LOAD_WAIT1 -> ST_LOAD_WAIT2 -> ST_LOAD_WRITE`，每 4 拍写入 1 个数据。本版本改为 `ST_LOAD_STREAM`，连续发出 `0..63` 地址，并通过地址/valid pipe 对齐 `test_vector_in` 后写入 internal `data_mem`。
- `verify_RAM` 写回控制整理：写回仍保持 `ST_WRITE` 中一拍一个数据，新增 `write_stream_active` 和 `write_last` 作为清晰控制信号。
- `flags forwarding` 规范化：`mcu_top.v` 中使用 `flag_forward_valid` 和 `flags_forwarded`，`cond_unit` 读取 forwarded flags。
- `reg_file bypass`：`reg_file.v` 新增 `bypass1` 和 `bypass2`，同周期 WB 写回和 ID 读同一寄存器时直接返回 `wd`。

## 4. 明确未做

- 双发射
- CSWAP
- macro-op fusion
- compare-swap 专用硬件
- 双端口 `data_mem`
- 多核
- 全硬件 sorting network

## 5. 修改文件列表

- `rtl/reg_file.v`
- `rtl/mcu_top.v`
- `rtl/top.v`
- `scripts/create_project.tcl`
- `README.md`
- `docs/V2_pipe3_io_forward_README.md`

未修改：

- `rtl/data_mem.v`
- `rtl/instr_rom.v`
- `rtl/control_unit.v`
- `rtl/cond_unit.v`
- `rtl/alu.v`

## 6. 验证方法

建议按以下顺序在本地 Vivado 2022.2 中验证：

1. `source scripts/create_project.tcl`
2. `source scripts/run_sim.tcl`
3. 确认 `total_errors = 0`
4. 确认 `state` 最后进入 `ST_DONE`
5. 确认 `verify_RAM[0..63]` signed 升序
6. 确认 `cnt_test` 非 0 且在最后一个 verify_RAM 数据写完后停止
7. 对比 P4 的 `cnt_test`
8. `source scripts/run_synth_impl.tcl`
9. 记录 timing/utilization 报告
10. 当前已按用户本地验证记录为 180 MHz 通过；后续如继续提频，应重新记录 WNS/WHS/LUT/FF/BRAM

当前交付未假定 Vivado/xsim 已通过；如未在本机跑脚本，请以本地 full64 仿真和 implementation 结果为准。

## 7. 需要记录的指标

- `cnt_test`
- `total_errors`
- WNS
- WHS
- LUT
- FF
- BRAM
- `total_time = cnt_test / frequency`，当前约 `2739 / 180 MHz = 15.22 us`

## 8. 设计边界确认

- top 层外部接口未新增端口。
- `DONE_PC` 保持 `0x000028B4`，debug PC 仍按 commit/WB 阶段语义使用。
- ARM-like 指令流和排序程序语义未改变。
- `cnt_test` 仍从开始读入 test_ROM 数据到最后一个 verify_RAM 数据写完为止，优化收益预期来自 load 阶段连续装载和寄存器/flags 前递减少冒险开销。

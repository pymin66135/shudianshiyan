# sort8_u16_unsigned for V0 ARM A32 MCU

## 功能

对 `data_mem.mem[0]` 到 `data_mem.mem[7]` 中的 8 个 **16 位无符号数**做升序排序。

数据布局：

- 一个 16 位无符号数占一个 32-bit word。
- 低 16 位有效，高 16 位必须为 `0`。
- byte address 为 `0, 4, 8, 12, 16, 20, 24, 28`。

## 依赖的 V0 MCU 能力

- `MOV R7, #0`
- `LDR Rt, [Rn, #imm12]`
- `SUBS R2, R0, R1` 更新 NZCV
- `STRHI Rt, [Rn, #imm12]`
- `B done`

无符号比较逻辑：

```asm
SUBS R2, R0, R1
STRHI R1, [R7, #addr_i]
STRHI R0, [R7, #addr_j]
```

其中 `HI` 等价于 unsigned `>`，即 `C=1 && Z=0`。

## 文件说明

- `sort8_u16_unsigned.s`：汇编可读版本。
- `sort8_u16_unsigned.lst`：带地址和机器码的 listing。
- `sort8_u16_unsigned.hex`：Vivado 仿真可加载的 program hex。
- `make_sort8_u16_program.py`：重新生成 `.hex` 和 `.lst` 的脚本。
- `tb_sort8_u16.v`：排序专用 testbench。

## Vivado 使用方式

1. 把 `sort8_u16_unsigned.hex` 放到 Vivado xsim 工作目录；或者在 `tb_sort8_u16.v` 中把：

```verilog
.PROGRAM_FILE("sort8_u16_unsigned.hex")
```

改成你的绝对路径。

2. 添加 `tb_sort8_u16.v` 为 simulation source，并设置为仿真顶层。

3. 确保 `mcu_top` 实例参数为：

```verilog
.PROGRAM_FROM_FILE(1)
```

4. 运行 Behavioral Simulation。

通过时控制台会显示：

```text
SORT8_U16 TEST PASSED.
```

# program.hex 说明

本目录中的 `program.hex` 是 V0 默认测试程序，对应 `instr_rom.v` 中内置程序。

默认 testbench 为了避免 Vivado 相对路径问题，使用 `PROGRAM_FROM_FILE=0`，即直接运行 `instr_rom.v` 的内置程序。

如果要手动加载本文件：

1. 在 `mcu_top_tb.v` 中把：

```verilog
.PROGRAM_FROM_FILE(0)
```

改为：

```verilog
.PROGRAM_FROM_FILE(1)
```

2. 确保 `program.hex` 位于 Vivado xsim 的工作目录，或把 `PROGRAM_FILE` 改成绝对路径，例如：

```verilog
.PROGRAM_FILE("D:/mcu_v0_arm_a32_single_cycle/program/program.hex")
```

## 测试程序内容

```asm
MOV R0, #5
MOV R1, #3
ADD R2, R0, R1
SUB R3, R0, R1
AND R4, R0, R1
ORR R5, R0, R1
MOV R7, #0
STR R2, [R7,#0]
STR R3, [R7,#4]
STR R4, [R7,#8]
STR R5, [R7,#12]
LDR R6, [R7,#0]
ADD R8, R6, #4
STR R8, [R7,#16]
B target
MOV R9, #99     ; skipped
MOV R9, #88     ; skipped
target:
ADD R9, R0, #2
BL func
MOV R10, #77    ; skipped
MOV R10, #66    ; skipped
func:
ADD R11, R0, #7
STR R11, [R7,#20]
STR R14, [R7,#24]
```

## 预期结果

- R0 = 5
- R1 = 3
- R2 = 8
- R3 = 2
- R4 = 1
- R5 = 7
- R6 = 8
- R8 = 12
- R9 = 7
- R10 = 0，因为被 B/BL 跳过
- R11 = 12
- R14 = 76，即 BL 指令地址 72 + 4
- mem[0] = 8
- mem[1] = 2
- mem[2] = 1
- mem[3] = 7
- mem[4] = 12
- mem[5] = 12
- mem[6] = 76

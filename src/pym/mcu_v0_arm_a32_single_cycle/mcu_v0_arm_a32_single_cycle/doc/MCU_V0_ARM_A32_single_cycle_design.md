# MCU V0 设计方案：32 位 ARM A32 子集单周期 MCU（仿真版）

版本：V0.1  
目标：使用 ARM A32 32 位指令编码，完成一个可仿真的单周期 MCU 原型。  
定位：理解型原型，不直接追求上板、排序/FFT 打榜或时序优化。

---

## 0. 设计边界

### 0.1 V0 必做目标

V0 只要求仿真跑通，不要求上板。

必须支持的 A32 子集：

| 类别 | 指令 | V0 支持范围 |
|---|---|---|
| 数据处理 | ADD | `ADD Rd, Rn, Rm` / `ADD Rd, Rn, #imm8` |
| 数据处理 | SUB | `SUB Rd, Rn, Rm` / `SUB Rd, Rn, #imm8` |
| 数据处理 | AND | `AND Rd, Rn, Rm` / `AND Rd, Rn, #imm8` |
| 数据处理 | ORR | `ORR Rd, Rn, Rm` / `ORR Rd, Rn, #imm8`，即课程口头说的 OR |
| 数据处理 | MOV | `MOV Rd, Rm` / `MOV Rd, #imm8` |
| 访存 | LDR | `LDR Rd, [Rn, #imm12]`，只支持 word 访问 |
| 访存 | STR | `STR Rd, [Rn, #imm12]`，只支持 word 访问 |
| 分支 | B | `B label` |
| 分支 | BL | `BL label`，写 `R14/LR = PC + 4` |

### 0.2 V0 暂不支持

V0 暂不支持以下 ARM 功能：

1. Thumb 指令。
2. 异常、中断、模式切换。
3. CPSR/SPSR 完整实现。
4. barrel shifter 完整移位功能。
5. A32 立即数旋转完整功能；V0 只要求 `rotate_imm = 0`。
6. byte/halfword 访存。
7. pre/post-index 全部寻址模式；V0 只支持 `[Rn, #imm12]`。
8. 写回寻址 `!`。
9. R15 作为普通寄存器读写。
10. 多周期/流水线。
11. 乘法器。

### 0.3 V0 设计原则

1. 使用真实 A32 32 位字段进行译码，避免后续推倒重来。
2. 每条指令一个时钟周期完成。
3. 指令存储器和数据存储器均为仿真用行为级 memory。
4. 数据宽度统一 32 位。
5. 寄存器堆采用 16 个 32 位寄存器：`R0` 到 `R15`，但 V0 不建议程序显式使用 R15。
6. `R14` 作为 link register，用于 `BL`。
7. 仿真中通过 debug 输出检查 PC、instruction、寄存器、数据存储器写入情况。

---

## 1. 顶层数据通路

### 1.1 单周期执行流程

每个时钟周期执行一条指令：

```text
PC
 ↓
Instruction ROM
 ↓
Decoder / Control Unit
 ↓
Register File  →  ALU  →  Write Back
       ↓            ↓
       └────── Data Memory
```

### 1.2 核心路径

#### 数据处理指令路径

```text
PC → instruction ROM → decode
→ regfile read Rn/Rm
→ operand2 decode
→ ALU
→ write back to Rd
→ PC + 4
```

#### LDR 指令路径

```text
PC → instruction ROM → decode
→ regfile read Rn as base
→ ALU computes address = Rn + imm12
→ data memory read
→ write back to Rd
→ PC + 4
```

#### STR 指令路径

```text
PC → instruction ROM → decode
→ regfile read Rn as base, Rd as store data
→ ALU computes address = Rn + imm12
→ data memory write
→ PC + 4
```

#### B 指令路径

```text
PC → instruction ROM → decode branch imm24
→ branch target = PC + 8 + sign_extend(imm24 << 2)
→ PC = branch target
```

#### BL 指令路径

```text
PC → instruction ROM → decode branch imm24
→ R14 = PC + 4
→ PC = PC + 8 + sign_extend(imm24 << 2)
```

---

## 2. A32 指令编码子集

### 2.1 通用字段

所有 A32 指令长度为 32 位：

```text
[31:28] cond
[27:0]  instruction body
```

V0 默认使用：

```text
cond = 1110  // AL, always
```

建议仍然实现 `cond_unit`，至少支持 AL，预留 EQ/NE/GE/LT。

---

## 3. 数据处理指令编码

### 3.1 A32 数据处理格式

```text
[31:28] cond
[27:26] 00
[25]    I
[24:21] opcode
[20]    S
[19:16] Rn
[15:12] Rd
[11:0]  Operand2
```

### 3.2 V0 支持 opcode

| 指令 | opcode[24:21] | ALU 操作 |
|---|---|---|
| AND | `0000` | A & B |
| SUB | `0010` | A - B |
| ADD | `0100` | A + B |
| ORR | `1100` | A \| B |
| MOV | `1101` | B |

### 3.3 V0 对 S 位的处理

V0 推荐实现两种模式：

1. `S = 0`：不更新 flags。
2. `S = 1`：更新 `N/Z/C/V`。

第一批测试可以只用 `S = 0`；但建议 ALU 已经输出 flags，后续排序条件分支会用到。

### 3.4 Operand2：寄存器形式

当 `I = 0`：

```text
[11:4] ignored / must be 0 in V0
[3:0]  Rm
```

V0 不实现移位器，所以测试程序里要求：

```text
Operand2[11:4] = 8'b00000000
```

示例：

```asm
ADD R2, R0, R1
```

### 3.5 Operand2：立即数形式

当 `I = 1`：

```text
[11:8] rotate_imm
[7:0]  imm8
```

V0 只支持：

```text
rotate_imm = 0
operand2 = zero_extend(imm8)
```

示例：

```asm
MOV R0, #5
ADD R1, R0, #3
```

---

## 4. LDR / STR 指令编码

### 4.1 A32 Single Data Transfer 格式

```text
[31:28] cond
[27:26] 01
[25]    I
[24]    P
[23]    U
[22]    B
[21]    W
[20]    L
[19:16] Rn
[15:12] Rd
[11:0]  imm12
```

### 4.2 V0 支持范围

V0 只支持：

```text
I = 0   // immediate offset
P = 1   // pre-index
U = 1   // add offset
B = 0   // word access
W = 0   // no write-back
```

因此只支持：

```asm
LDR Rd, [Rn, #imm12]
STR Rd, [Rn, #imm12]
```

### 4.3 L 位含义

| L | 指令 |
|---|---|
| 1 | LDR |
| 0 | STR |

### 4.4 地址解释

ALU 计算：

```text
address = Rn + zero_extend(imm12)
```

数据存储器按 word 寻址：

```text
word_index = address[ADDR_BITS+1:2]
```

也就是说，如果程序想访问第 0、1、2 个 word，应使用地址：

```text
0, 4, 8, 12, ...
```

---

## 5. B / BL 指令编码

### 5.1 A32 Branch 格式

```text
[31:28] cond
[27:25] 101
[24]    L
[23:0]  imm24
```

### 5.2 L 位含义

| L | 指令 | 行为 |
|---|---|---|
| 0 | B | PC 跳转 |
| 1 | BL | R14 = PC + 4，然后 PC 跳转 |

### 5.3 分支目标计算

V0 按 A32 习惯计算：

```text
branch_target = PC + 8 + sign_extend(imm24 << 2)
```

其中 PC 是当前指令地址。

### 5.4 汇编器需要遵守的 offset 公式

如果目标标签地址为 `target_addr`，当前 B/BL 指令地址为 `pc`：

```text
imm24 = (target_addr - (pc + 8)) >> 2
```

---

## 6. 条件执行与 flags

### 6.1 Flags 定义

```text
N: Negative，结果最高位 result[31]
Z: Zero，结果是否为 0
C: Carry / Not Borrow
V: Signed Overflow
```

### 6.2 V0 必须支持的 cond

| cond | 名称 | 含义 | V0 建议 |
|---|---|---|---|
| 1110 | AL | always | 必做 |
| 0000 | EQ | Z == 1 | 可做，便于后续 |
| 0001 | NE | Z == 0 | 可做，便于后续 |
| 1010 | GE | N == V | 可做，便于后续排序 |
| 1011 | LT | N != V | 可做，便于后续排序 |
| 1100 | GT | Z == 0 && N == V | 可做 |
| 1101 | LE | Z == 1 || N != V | 可做 |

### 6.3 条件不满足时的行为

当 `cond_pass = 0`：

1. 不写寄存器。
2. 不写数据存储器。
3. 不更新 flags。
4. PC 正常 `PC + 4`。

---

## 7. 控制信号定义

### 7.1 控制信号总表

| 信号 | 位宽 | 含义 |
|---|---:|---|
| `reg_write` | 1 | 是否写寄存器 |
| `mem_write` | 1 | 是否写数据存储器 |
| `mem_to_reg` | 1 | 写回数据来自 data memory |
| `alu_src_imm` | 1 | ALU B 端是否使用立即数 |
| `alu_op` | 4 | ALU 操作码 |
| `branch` | 1 | 是否为 B/BL |
| `link` | 1 | 是否为 BL |
| `flag_write` | 1 | 是否更新 flags |
| `unsupported` | 1 | 是否遇到 V0 不支持指令 |

### 7.2 ALU 操作码建议

```verilog
localparam ALU_AND = 4'b0000;
localparam ALU_SUB = 4'b0010;
localparam ALU_ADD = 4'b0100;
localparam ALU_ORR = 4'b1100;
localparam ALU_MOV = 4'b1101;
```

### 7.3 控制表

| 指令 | reg_write | mem_write | mem_to_reg | alu_src_imm | alu_op | branch | link | flag_write |
|---|---:|---:|---:|---:|---|---:|---:|---:|
| ADD reg | 1 | 0 | 0 | 0 | ADD | 0 | 0 | S |
| ADD imm | 1 | 0 | 0 | 1 | ADD | 0 | 0 | S |
| SUB reg | 1 | 0 | 0 | 0 | SUB | 0 | 0 | S |
| SUB imm | 1 | 0 | 0 | 1 | SUB | 0 | 0 | S |
| AND reg | 1 | 0 | 0 | 0 | AND | 0 | 0 | S |
| AND imm | 1 | 0 | 0 | 1 | AND | 0 | 0 | S |
| ORR reg | 1 | 0 | 0 | 0 | ORR | 0 | 0 | S |
| ORR imm | 1 | 0 | 0 | 1 | ORR | 0 | 0 | S |
| MOV reg | 1 | 0 | 0 | 0 | MOV | 0 | 0 | S |
| MOV imm | 1 | 0 | 0 | 1 | MOV | 0 | 0 | S |
| LDR | 1 | 0 | 1 | 1 | ADD | 0 | 0 | 0 |
| STR | 0 | 1 | 0 | 1 | ADD | 0 | 0 | 0 |
| B | 0 | 0 | 0 | x | x | 1 | 0 | 0 |
| BL | 1 | 0 | 0 | x | x | 1 | 1 | 0 |

说明：

- `BL` 写寄存器时，写入目标固定为 `R14`，写入数据为 `PC + 4`。
- 表中所有写使能都必须再与 `cond_pass` 相与。

---

## 8. 模块划分

建议文件结构：

```text
mcu_v0/
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
└── doc/
    └── MCU_V0_ARM_A32_single_cycle_design.md
```

---

# 9. 每个 .v 文件开头必须写的接口说明模板

下面每个模块都给出建议接口。正式写代码时，每个 `.v` 文件开头必须先写这一段注释，并保持端口一致。

---

## 9.1 `mcu_top.v`

### 功能

单周期 MCU 顶层，连接 PC、指令 ROM、控制器、寄存器堆、ALU、数据存储器、分支单元。

### 文件开头注释模板

```verilog
//============================================================
// Module: mcu_top
// Description:
//   Top-level module of V0 ARM A32 subset single-cycle MCU.
//   Simulation-only version.
//
// Inputs:
//   clk              : system clock
//   rst_n            : active-low reset
//
// Outputs:
//   debug_pc         : current PC value
//   debug_instr      : current instruction
//   debug_alu_result : ALU result of current instruction
//   debug_mem_wdata  : data written to data memory
//   debug_mem_addr   : data memory byte address
//   debug_reg_wdata  : data written back to register file
//   debug_reg_waddr  : register write address
//   debug_reg_write  : effective register write enable
//   debug_mem_write  : effective memory write enable
//   debug_flags      : current NZCV flags
//   debug_unsupported: high when instruction is unsupported in V0
//============================================================
```

### 端口定义建议

```verilog
module mcu_top (
    input  wire        clk,
    input  wire        rst_n,

    output wire [31:0] debug_pc,
    output wire [31:0] debug_instr,
    output wire [31:0] debug_alu_result,
    output wire [31:0] debug_mem_wdata,
    output wire [31:0] debug_mem_addr,
    output wire [31:0] debug_reg_wdata,
    output wire [3:0]  debug_reg_waddr,
    output wire        debug_reg_write,
    output wire        debug_mem_write,
    output wire [3:0]  debug_flags,
    output wire        debug_unsupported
);
```

---

## 9.2 `pc_reg.v`

### 功能

保存当前 PC，在时钟上升沿更新。复位后 PC = 0。

### 文件开头注释模板

```verilog
//============================================================
// Module: pc_reg
// Description:
//   Program counter register.
//
// Inputs:
//   clk     : system clock
//   rst_n   : active-low reset
//   next_pc : next PC value
//
// Outputs:
//   pc      : current PC value
//============================================================
```

### 端口定义建议

```verilog
module pc_reg (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] next_pc,
    output reg  [31:0] pc
);
```

---

## 9.3 `instr_rom.v`

### 功能

仿真用指令 ROM。使用 `readmemh` 从 `program.hex` 读取 32 位 A32 指令。

### 文件开头注释模板

```verilog
//============================================================
// Module: instr_rom
// Description:
//   Simulation instruction ROM.
//   Address is byte address from PC.
//   Word index uses pc[ADDR_WIDTH+1:2].
//
// Parameters:
//   ADDR_WIDTH : word address width
//   INIT_FILE  : hex file used by $readmemh
//
// Inputs:
//   pc    : byte address of current instruction
//
// Outputs:
//   instr : 32-bit instruction word
//============================================================
```

### 端口定义建议

```verilog
module instr_rom #(
    parameter ADDR_WIDTH = 8,
    parameter INIT_FILE  = "program.hex"
)(
    input  wire [31:0] pc,
    output wire [31:0] instr
);
```

---

## 9.4 `control_unit.v`

### 功能

解析 A32 指令字段，生成控制信号。

### 文件开头注释模板

```verilog
//============================================================
// Module: control_unit
// Description:
//   Decode ARM A32 subset instructions and generate control signals.
//
// Inputs:
//   instr       : 32-bit A32 instruction
//
// Outputs:
//   instr_class : instruction class for debug/optional use
//   reg_write   : raw register write enable before condition check
//   mem_write   : raw memory write enable before condition check
//   mem_to_reg  : select memory read data as write-back data
//   alu_src_imm : select immediate as ALU operand B
//   alu_op      : ALU operation code
//   branch      : high for B/BL
//   link        : high for BL
//   flag_write  : raw flag write enable before condition check
//   unsupported : high when instruction is not supported by V0
//============================================================
```

### 端口定义建议

```verilog
module control_unit (
    input  wire [31:0] instr,

    output reg  [1:0]  instr_class,
    output reg         reg_write,
    output reg         mem_write,
    output reg         mem_to_reg,
    output reg         alu_src_imm,
    output reg  [3:0]  alu_op,
    output reg         branch,
    output reg         link,
    output reg         flag_write,
    output reg         unsupported
);
```

---

## 9.5 `cond_unit.v`

### 功能

根据 `cond` 和当前 flags 判断指令是否执行。

### 文件开头注释模板

```verilog
//============================================================
// Module: cond_unit
// Description:
//   ARM condition code checker.
//
// Inputs:
//   cond      : instruction condition field instr[31:28]
//   flags     : current NZCV flags, flags[3]=N, flags[2]=Z, flags[1]=C, flags[0]=V
//
// Outputs:
//   cond_pass : high when condition is satisfied
//============================================================
```

### 端口定义建议

```verilog
module cond_unit (
    input  wire [3:0] cond,
    input  wire [3:0] flags,
    output reg        cond_pass
);
```

---

## 9.6 `reg_file.v`

### 功能

16 × 32 位寄存器堆，两个异步读端口，一个同步写端口。

### 文件开头注释模板

```verilog
//============================================================
// Module: reg_file
// Description:
//   16 x 32-bit register file.
//   Two asynchronous read ports and one synchronous write port.
//   R15 is not recommended for general use in V0.
//
// Inputs:
//   clk      : system clock
//   rst_n    : active-low reset
//   ra1      : read address 1
//   ra2      : read address 2
//   wa       : write address
//   wd       : write data
//   we       : write enable
//
// Outputs:
//   rd1      : read data 1
//   rd2      : read data 2
//   debug_r0 : register R0 value
//   debug_r1 : register R1 value
//   debug_r2 : register R2 value
//   debug_r3 : register R3 value
//============================================================
```

### 端口定义建议

```verilog
module reg_file (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [3:0]  ra1,
    input  wire [3:0]  ra2,
    input  wire [3:0]  wa,
    input  wire [31:0] wd,
    input  wire        we,

    output wire [31:0] rd1,
    output wire [31:0] rd2,
    output wire [31:0] debug_r0,
    output wire [31:0] debug_r1,
    output wire [31:0] debug_r2,
    output wire [31:0] debug_r3
);
```

---

## 9.7 `alu.v`

### 功能

执行 ADD/SUB/AND/ORR/MOV，输出结果和 NZCV flags。

### 文件开头注释模板

```verilog
//============================================================
// Module: alu
// Description:
//   ALU for ARM A32 subset.
//
// Inputs:
//   a          : operand A
//   b          : operand B
//   alu_op     : ALU operation code
//
// Outputs:
//   result     : ALU result
//   flags_out  : NZCV flags generated by current operation
//============================================================
```

### 端口定义建议

```verilog
module alu (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_op,
    output reg  [31:0] result,
    output reg  [3:0]  flags_out
);
```

### flags 计算要求

ADD：

```text
result = a + b
N = result[31]
Z = result == 0
C = carry out
V = (~(a[31] ^ b[31])) & (a[31] ^ result[31])
```

SUB：

```text
result = a - b
N = result[31]
Z = result == 0
C = no borrow = a >= b unsigned
V = (a[31] ^ b[31]) & (a[31] ^ result[31])
```

AND/ORR/MOV：

```text
N = result[31]
Z = result == 0
C = 0 in V0, or keep old C in later version
V = 0 in V0, or keep old V in later version
```

V0 为简单起见可令逻辑指令 C/V 为 0。若想更接近 ARM，可让 C 来自 shifter carry out。

---

## 9.8 `operand2_decode.v`

### 功能

根据 A32 Operand2 字段生成 ALU 的第二操作数。V0 支持寄存器或 imm8 立即数，不支持完整 rotate/shift。

### 文件开头注释模板

```verilog
//============================================================
// Module: operand2_decode
// Description:
//   Decode ARM A32 Operand2 for data-processing instructions.
//   V0 supports register Rm and immediate imm8 with rotate_imm = 0.
//
// Inputs:
//   instr       : 32-bit A32 instruction
//   rm_value    : register Rm value from register file
//
// Outputs:
//   operand2    : decoded operand2 value
//   unsupported : high when Operand2 format is not supported in V0
//============================================================
```

### 端口定义建议

```verilog
module operand2_decode (
    input  wire [31:0] instr,
    input  wire [31:0] rm_value,
    output reg  [31:0] operand2,
    output reg         unsupported
);
```

---

## 9.9 `data_mem.v`

### 功能

仿真用数据存储器。支持 32 位 word 读写。

### 文件开头注释模板

```verilog
//============================================================
// Module: data_mem
// Description:
//   Simulation data memory.
//   Word-addressed internally; byte address externally.
//   Combinational read and synchronous write for single-cycle MCU.
//
// Parameters:
//   ADDR_WIDTH : word address width
//
// Inputs:
//   clk        : system clock
//   addr       : byte address
//   write_data : data to be written
//   mem_write  : memory write enable
//
// Outputs:
//   read_data  : data read from memory
//============================================================
```

### 端口定义建议

```verilog
module data_mem #(
    parameter ADDR_WIDTH = 8
)(
    input  wire        clk,
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire        mem_write,
    output wire [31:0] read_data
);
```

---

## 9.10 `branch_unit.v`

### 功能

计算 PC + 4、PC + 8 和 branch target。

### 文件开头注释模板

```verilog
//============================================================
// Module: branch_unit
// Description:
//   Compute next PC for sequential and branch instructions.
//
// Inputs:
//   pc        : current PC
//   instr     : current instruction
//   branch    : high for B/BL
//   cond_pass : high when condition is satisfied
//
// Outputs:
//   pc_plus4      : pc + 4
//   branch_target : pc + 8 + sign_extend(imm24 << 2)
//   next_pc       : selected next PC
//============================================================
```

### 端口定义建议

```verilog
module branch_unit (
    input  wire [31:0] pc,
    input  wire [31:0] instr,
    input  wire        branch,
    input  wire        cond_pass,
    output wire [31:0] pc_plus4,
    output wire [31:0] branch_target,
    output wire [31:0] next_pc
);
```

---

## 9.11 `mcu_top_tb.v`

### 功能

仿真顶层测试文件。负责产生时钟、复位、运行固定周期、检查结果。

### 文件开头注释模板

```verilog
//============================================================
// Module: mcu_top_tb
// Description:
//   Testbench for V0 ARM A32 subset single-cycle MCU.
//
// Test items:
//   1. ADD/SUB/AND/ORR/MOV register and immediate instructions.
//   2. LDR/STR memory access.
//   3. B/BL branch and link behavior.
//
// Expected results:
//   Checked by debug signals and/or register debug outputs.
//============================================================
```

---

# 10. 顶层连线规则

## 10.1 指令字段提取

```verilog
wire [3:0] cond   = instr[31:28];
wire [1:0] op     = instr[27:26];
wire       bit25  = instr[25];
wire [3:0] opcode = instr[24:21];
wire       s_bit  = instr[20];
wire [3:0] rn     = instr[19:16];
wire [3:0] rd     = instr[15:12];
wire [3:0] rm     = instr[3:0];
```

## 10.2 寄存器读地址选择

读端口 1：

```text
ra1 = Rn
```

读端口 2：

```text
如果是 STR：ra2 = Rd，因为 Rd 是要写入内存的数据
否则：ra2 = Rm
```

## 10.3 ALU 输入选择

```text
alu_a = regfile[ra1]
```

```text
如果是 LDR/STR：alu_b = zero_extend(imm12)
如果是数据处理立即数：alu_b = operand2_decode immediate
如果是数据处理寄存器：alu_b = regfile[rm]
```

MOV 指令中 `alu_a` 可忽略，ALU 直接输出 `alu_b`。

## 10.4 写回寄存器地址选择

```text
如果是 BL：wa = 4'd14
否则：wa = Rd
```

## 10.5 写回数据选择

```text
如果是 BL：wd = PC + 4
否则如果是 LDR：wd = data_mem_read_data
否则：wd = alu_result
```

## 10.6 有效写使能

```text
effective_reg_write = raw_reg_write & cond_pass & ~unsupported_total
effective_mem_write = raw_mem_write & cond_pass & ~unsupported_total
effective_flag_write = raw_flag_write & cond_pass & ~unsupported_total
```

`unsupported_total` 应该包括：

```text
control_unit unsupported
operand2_decode unsupported
```

---

# 11. 仿真程序设计

## 11.1 测试程序 1：ALU 指令

目标：验证 MOV/ADD/SUB/AND/ORR。

汇编：

```asm
MOV R0, #5
MOV R1, #3
ADD R2, R0, R1
SUB R3, R0, R1
AND R4, R0, R1
ORR R5, R0, R1
STR R2, [R7, #0]
STR R3, [R7, #4]
STR R4, [R7, #8]
STR R5, [R7, #12]
```

预期：

```text
R2 = 8
R3 = 2
R4 = 1
R5 = 7
mem[0] = 8
mem[1] = 2
mem[2] = 1
mem[3] = 7
```

注意：这里默认 R7 初始为 0。也可以先 `MOV R7, #0`。

## 11.2 测试程序 2：LDR/STR

汇编：

```asm
MOV R0, #0
MOV R1, #12
STR R1, [R0, #0]
LDR R2, [R0, #0]
ADD R3, R1, R2
STR R3, [R0, #4]
```

预期：

```text
R2 = 12
R3 = 24
mem[0] = 12
mem[1] = 24
```

## 11.3 测试程序 3：B

汇编：

```asm
MOV R0, #1
B target
MOV R0, #99
MOV R0, #88
target:
ADD R1, R0, #2
STR R1, [R7, #0]
```

预期：

```text
R0 = 1
R1 = 3
mem[0] = 3
```

## 11.4 测试程序 4：BL

汇编：

```asm
MOV R0, #5
BL func
STR R1, [R7, #0]
B done
func:
ADD R1, R0, #7
B R14      ; V0 不支持寄存器跳转，所以这条不能用

done:
```

说明：V0 不支持 `BX LR` 或 `MOV PC, LR`，所以 BL 的完整函数返回暂时不做。V0 的 BL 只验证：

```text
R14 = BL 指令地址 + 4
PC 跳到目标地址
```

更适合的 BL 测试：

```asm
MOV R0, #5
BL func
MOV R2, #99
func:
ADD R1, R0, #7
STR R1, [R7, #0]
```

预期：

```text
R14 = BL 后一条指令地址
R1 = 12
mem[0] = 12
```

---

# 12. A32 机器码示例

以下示例用于手写 `program.hex` 初步测试。

## 12.1 常用编码

```asm
MOV R0, #5      ; E3A00005
MOV R1, #3      ; E3A01003
ADD R2, R0, R1  ; E0802001
SUB R3, R0, R1  ; E0403001
AND R4, R0, R1  ; E0004001
ORR R5, R0, R1  ; E1805001
MOV R7, #0      ; E3A07000
STR R2, [R7,#0] ; E5872000
STR R3, [R7,#4] ; E5873004
STR R4, [R7,#8] ; E5874008
STR R5,[R7,#12] ; E587500C
```

## 12.2 `program.hex` 示例

```text
E3A00005
E3A01003
E0802001
E0403001
E0004001
E1805001
E3A07000
E5872000
E5873004
E5874008
E587500C
```

---

# 13. 代码编写约定

## 13.1 命名约定

1. 时钟：`clk`
2. 低有效复位：`rst_n`
3. 写使能：`*_write` 或 `*_we`
4. 地址：`*_addr`
5. 写数据：`*_wdata`
6. 读数据：`*_rdata`
7. 调试输出：`debug_*`
8. 当前 PC：`pc`
9. 下一 PC：`next_pc`

## 13.2 Verilog 风格

1. 组合逻辑使用 `always @(*)`。
2. 时序逻辑使用 `always @(posedge clk or negedge rst_n)`。
3. 所有组合逻辑必须给默认值，避免 latch。
4. 所有模块必须写 `endmodule` 后注释模块名。
5. 不在多个 always 块中驱动同一个 reg。
6. 顶层只做连线和少量 mux，不堆复杂 case。
7. 初始版本优先可读性，不追求极限资源。

## 13.3 reset 约定

复位时：

```text
PC = 0
R0-R15 = 0
flags = 0000
数据存储器可清零，也可不清零；测试最好主动写入需要的值
```

---

# 14. 仿真验收标准

V0 完成标准：

| 编号 | 检查项 | 通过标准 |
|---|---|---|
| 1 | PC 顺序更新 | 普通指令 PC 每周期 +4 |
| 2 | instruction ROM | PC 对应正确指令 |
| 3 | MOV imm | 能写立即数到寄存器 |
| 4 | ADD/SUB reg | 结果正确 |
| 5 | AND/ORR reg | 结果正确 |
| 6 | STR | 能把寄存器值写入 data memory |
| 7 | LDR | 能从 data memory 读回寄存器 |
| 8 | B | 能跳过中间指令 |
| 9 | BL | 能跳转且 R14 = PC + 4 |
| 10 | unsupported | 遇到不支持指令不误写寄存器或内存 |

---

# 15. 后续扩展路线

V0 完成后，建议按这个顺序扩展：

## V0.2：条件码与 CMP

新增：

```asm
CMP Rn, Rm
CMP Rn, #imm
BEQ / BNE / BLT / BGE
```

用途：排序循环和有符号比较。

## V0.3：更完整的 LDR/STR

新增：

```asm
LDR Rd, [Rn]
STR Rd, [Rn]
LDR Rd, [Rn, #imm]
STR Rd, [Rn, #imm]
```

同时明确字节地址与 word index 的关系。

## V0.4：排序程序最小闭环

实现：

```text
内部 data_mem 中预置 8 或 16 个数
MCU 用选择排序排序
结果写回 data_mem
仿真自动检查
```

先做 8 个数，再扩展到 64 个数。

## V1：接近课程验收接口

加入：

```text
test_ROM / test_vector_in
verify_RAM / verify_vector_out
cnt_test
```

这个才进入课程设计正式方向。

---

# 16. 分工建议

## A：硬件顶层与数据通路

负责：

```text
mcu_top.v
pc_reg.v
instr_rom.v
branch_unit.v
顶层连线
```

## B：指令译码与执行

负责：

```text
control_unit.v
operand2_decode.v
alu.v
A32 机器码表
program.hex
```

## C：寄存器、内存与验证

负责：

```text
reg_file.v
data_mem.v
mcu_top_tb.v
仿真波形检查
测试结果记录
```

三个人必须共同维护：

```text
doc/MCU_V0_ARM_A32_single_cycle_design.md
```

任何接口变化，必须先改设计文件，再改代码。

---

# 17. 关键风险与处理

## 风险 1：A32 编码看起来复杂

处理：只支持固定子集，先用手写机器码跑通，不急着写完整 assembler。

## 风险 2：branch 偏移算错

处理：统一公式：

```text
imm24 = (target_addr - (pc + 8)) >> 2
branch_target = pc + 8 + sign_extend(imm24 << 2)
```

## 风险 3：LDR/STR 地址错位

处理：统一规定外部是 byte address，内部 memory 用：

```text
word_index = addr[ADDR_WIDTH+1:2]
```

## 风险 4：STR 读错寄存器

处理：STR 的 `Rd` 不是写回目标，而是要写进内存的数据寄存器。regfile 第二读口在 STR 时必须选择 `Rd`。

## 风险 5：BL 没有返回

处理：V0 只验证 BL 写 LR 和跳转，不实现函数返回。后续要支持返回时再加入 `BX LR` 或 `MOV PC, LR`。

## 风险 6：条件不满足时误写

处理：所有写使能必须经过：

```text
raw_write_enable & cond_pass & ~unsupported_total
```

---

# 18. 最终 V0 完成判定

当以下结果全部满足，就认为 V0 设计成功：

1. `program.hex` 可以加载到 `instr_rom`。
2. 仿真中 PC 从 0 开始按指令执行。
3. `MOV/ADD/SUB/AND/ORR` 结果正确。
4. `STR/LDR` 能正确访问 data memory。
5. `B` 能正确跳转。
6. `BL` 能正确写 R14 并跳转。
7. 所有 `.v` 文件接口和本文档一致。
8. testbench 能自动或半自动检查关键寄存器/内存结果。

完成 V0 后，下一步不是直接冲 FFT，而是先扩展 `CMP + 条件分支 + 小规模排序仿真`。

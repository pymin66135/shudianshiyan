//============================================================
// Module: instr_rom
// Description:
//   Simulation instruction ROM.
//   Address is byte address from PC.
//   Word index uses pc[ADDR_WIDTH+1:2].
//
// 主要结构:
//   1. 参数定义：定义了 ROM 地址宽度和初始化文件路径（已修正为正斜杠）。
//   2. 存储器定义：根据深度参数定义 32 位宽度的寄存器数组。
//   3. 默认初始化：在 initial 块中，首先将全部存储空间默认刷为 NOP 指令。
//   4. 程序烧录：顺序硬编码写入传入的 97 条新机器码序列。
//   5. 外部加载：若启用 USE_INIT_FILE，则调用 $readmemh 覆盖当前程序。
//   6. 异步读取：通过 assign 语句，根据当前 PC 实时输出对应的指令字。
//============================================================

`timescale 1ns/1ps

module instr_rom #(
    parameter ADDR_WIDTH    = 8,
    // 注意：已将绝对路径中的反斜杠（\）替换为正斜杠（/），防止编译器转义报错
    parameter INIT_FILE     = "F:/FPGA/shudianshiyan/src/zhx/sort8_u16_v0/sort8_u16_unsigned.hex",
    parameter USE_INIT_FILE = 0
)(
    input  wire [31:0] pc,
    output wire [31:0] instr
);

localparam DEPTH = (1 << ADDR_WIDTH);

reg [31:0] rom [0:DEPTH-1];
integer i;

initial begin
    // Default all instructions to ARM NOP: MOV R0, R0
    for (i = 0; i < DEPTH; i = i + 1) begin
        rom[i] = 32'hE1A00000;
    end

    //============================================================
    // Built-in sort8_u16_unsigned program
    //
    // Algorithm:
    //   for outer_remaining = 7 downto 1:
    //       j = 0
    //       addr = 0
    //       while j < outer_remaining:
    //           if a[j] > a[j+1]:
    //               swap(a[j], a[j+1])
    //           addr += 4
    //           j += 1
    //
    // Data layout:
    //   data_mem.mem[0] = a[0]
    //   data_mem.mem[1] = a[1]
    //   ...
    //   data_mem.mem[7] = a[7]
    //
    // Each element is one 32-bit word.
    // Low 16 bits are valid as unsigned 16-bit data.
    //
    // Required instructions:
    //   MOV, ADD, LDR, STR, SUBS, BLS, BLO, BNE, B
    //============================================================

    rom[0]  = 32'hE3A00007; // 0000: MOV  R0, #7        ; outer_remaining = 7
    rom[1]  = 32'hE3A01000; // 0004: MOV  R1, #0        ; OUTER: j = 0
    rom[2]  = 32'hE3A07000; // 0008: MOV  R7, #0        ; byte address = 0

    rom[3]  = 32'hE5973000; // 000C: LDR  R3, [R7,#0]   ; INNER: a[j]
    rom[4]  = 32'hE5974004; // 0010: LDR  R4, [R7,#4]   ; a[j+1]
    rom[5]  = 32'hE0535004; // 0014: SUBS R5, R3, R4    ; set NZCV for unsigned compare
    rom[6]  = 32'h9A000001; // 0018: BLS  NOSWAP        ; if R3 <= R4 unsigned, skip swap

    rom[7]  = 32'hE5874000; // 001C: STR  R4, [R7,#0]   ; swap: a[j] = R4
    rom[8]  = 32'hE5873004; // 0020: STR  R3, [R7,#4]   ; swap: a[j+1] = R3

    rom[9]  = 32'hE2877004; // 0024: ADD  R7, R7, #4    ; NOSWAP: next byte address
    rom[10] = 32'hE2811001; // 0028: ADD  R1, R1, #1    ; j++
    rom[11] = 32'hE0515000; // 002C: SUBS R5, R1, R0    ; compare j and outer_remaining
    rom[12] = 32'h3AFFFFF5; // 0030: BLO  INNER         ; while j < outer_remaining

    rom[13] = 32'hE2500001; // 0034: SUBS R0, R0, #1    ; outer_remaining--
    rom[14] = 32'h1AFFFFF1; // 0038: BNE  OUTER         ; while outer_remaining != 0
    rom[15] = 32'hEAFFFFFE; // 003C: DONE: B DONE       ; halt by self-loop

    if (USE_INIT_FILE != 0) begin
        $display("[instr_rom] Loading instruction file: %s", INIT_FILE);
        $readmemh(INIT_FILE, rom);
    end
end

assign instr = rom[pc[ADDR_WIDTH+1:2]];

endmodule // instr_rom
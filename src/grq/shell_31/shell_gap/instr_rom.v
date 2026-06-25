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
    // Built-in shell64_signed_gap31 program
    //
    // Shell sort for 64 signed 16-bit values stored as sign-extended
    // 32-bit words in data_mem.
    //
    // Gap sequence in elements:
    //   31, 15, 7, 3, 1
    //
    // Gap sequence in byte addresses:
    //   124, 60, 28, 12, 4
    //
    // Registers:
    //   R0 = gap_bytes
    //   R1 = addr_i
    //   R2 = addr_j
    //   R3 = temp
    //   R4 = prev_addr
    //   R5 = prev_value
    //   R6 = compare/temp
    //
    // DONE loop at PC = 0x00000168.
    //============================================================

    rom[0]   = 32'hE3A0007C; // 0000: MOV R0,#124
    rom[1]   = 32'hE3A0107C; // 0004: MOV R1,#124
    rom[2]   = 32'hE25160FC; // 0008: SUBS R6,R1,#252
    rom[3]   = 32'hCA00000D; // 000C: BGT NEXT_124
    rom[4]   = 32'hE5913000; // 0010: LDR R3,[R1,#0]
    rom[5]   = 32'hE1A02001; // 0014: MOV R2,R1
    rom[6]   = 32'hE0526000; // 0018: SUBS R6,R2,R0
    rom[7]   = 32'hBA000006; // 001C: BLT INSERT_124
    rom[8]   = 32'hE1A04006; // 0020: MOV R4,R6
    rom[9]   = 32'hE5945000; // 0024: LDR R5,[R4,#0]
    rom[10]  = 32'hE0556003; // 0028: SUBS R6,R5,R3
    rom[11]  = 32'hDA000002; // 002C: BLE INSERT_124
    rom[12]  = 32'hE5825000; // 0030: STR R5,[R2,#0]
    rom[13]  = 32'hE1A02004; // 0034: MOV R2,R4
    rom[14]  = 32'hEAFFFFF6; // 0038: B WHILE_124
    rom[15]  = 32'hE5823000; // 003C: STR R3,[R2,#0]
    rom[16]  = 32'hE2811004; // 0040: ADD R1,R1,#4
    rom[17]  = 32'hEAFFFFEF; // 0044: B FOR_124

    rom[18]  = 32'hE3A0003C; // 0048: MOV R0,#60
    rom[19]  = 32'hE3A0103C; // 004C: MOV R1,#60
    rom[20]  = 32'hE25160FC; // 0050: SUBS R6,R1,#252
    rom[21]  = 32'hCA00000D; // 0054: BGT NEXT_60
    rom[22]  = 32'hE5913000; // 0058: LDR R3,[R1,#0]
    rom[23]  = 32'hE1A02001; // 005C: MOV R2,R1
    rom[24]  = 32'hE0526000; // 0060: SUBS R6,R2,R0
    rom[25]  = 32'hBA000006; // 0064: BLT INSERT_60
    rom[26]  = 32'hE1A04006; // 0068: MOV R4,R6
    rom[27]  = 32'hE5945000; // 006C: LDR R5,[R4,#0]
    rom[28]  = 32'hE0556003; // 0070: SUBS R6,R5,R3
    rom[29]  = 32'hDA000002; // 0074: BLE INSERT_60
    rom[30]  = 32'hE5825000; // 0078: STR R5,[R2,#0]
    rom[31]  = 32'hE1A02004; // 007C: MOV R2,R4
    rom[32]  = 32'hEAFFFFF6; // 0080: B WHILE_60
    rom[33]  = 32'hE5823000; // 0084: STR R3,[R2,#0]
    rom[34]  = 32'hE2811004; // 0088: ADD R1,R1,#4
    rom[35]  = 32'hEAFFFFEF; // 008C: B FOR_60

    rom[36]  = 32'hE3A0001C; // 0090: MOV R0,#28
    rom[37]  = 32'hE3A0101C; // 0094: MOV R1,#28
    rom[38]  = 32'hE25160FC; // 0098: SUBS R6,R1,#252
    rom[39]  = 32'hCA00000D; // 009C: BGT NEXT_28
    rom[40]  = 32'hE5913000; // 00A0: LDR R3,[R1,#0]
    rom[41]  = 32'hE1A02001; // 00A4: MOV R2,R1
    rom[42]  = 32'hE0526000; // 00A8: SUBS R6,R2,R0
    rom[43]  = 32'hBA000006; // 00AC: BLT INSERT_28
    rom[44]  = 32'hE1A04006; // 00B0: MOV R4,R6
    rom[45]  = 32'hE5945000; // 00B4: LDR R5,[R4,#0]
    rom[46]  = 32'hE0556003; // 00B8: SUBS R6,R5,R3
    rom[47]  = 32'hDA000002; // 00BC: BLE INSERT_28
    rom[48]  = 32'hE5825000; // 00C0: STR R5,[R2,#0]
    rom[49]  = 32'hE1A02004; // 00C4: MOV R2,R4
    rom[50]  = 32'hEAFFFFF6; // 00C8: B WHILE_28
    rom[51]  = 32'hE5823000; // 00CC: STR R3,[R2,#0]
    rom[52]  = 32'hE2811004; // 00D0: ADD R1,R1,#4
    rom[53]  = 32'hEAFFFFEF; // 00D4: B FOR_28

    rom[54]  = 32'hE3A0000C; // 00D8: MOV R0,#12
    rom[55]  = 32'hE3A0100C; // 00DC: MOV R1,#12
    rom[56]  = 32'hE25160FC; // 00E0: SUBS R6,R1,#252
    rom[57]  = 32'hCA00000D; // 00E4: BGT NEXT_12
    rom[58]  = 32'hE5913000; // 00E8: LDR R3,[R1,#0]
    rom[59]  = 32'hE1A02001; // 00EC: MOV R2,R1
    rom[60]  = 32'hE0526000; // 00F0: SUBS R6,R2,R0
    rom[61]  = 32'hBA000006; // 00F4: BLT INSERT_12
    rom[62]  = 32'hE1A04006; // 00F8: MOV R4,R6
    rom[63]  = 32'hE5945000; // 00FC: LDR R5,[R4,#0]
    rom[64]  = 32'hE0556003; // 0100: SUBS R6,R5,R3
    rom[65]  = 32'hDA000002; // 0104: BLE INSERT_12
    rom[66]  = 32'hE5825000; // 0108: STR R5,[R2,#0]
    rom[67]  = 32'hE1A02004; // 010C: MOV R2,R4
    rom[68]  = 32'hEAFFFFF6; // 0110: B WHILE_12
    rom[69]  = 32'hE5823000; // 0114: STR R3,[R2,#0]
    rom[70]  = 32'hE2811004; // 0118: ADD R1,R1,#4
    rom[71]  = 32'hEAFFFFEF; // 011C: B FOR_12

    rom[72]  = 32'hE3A00004; // 0120: MOV R0,#4
    rom[73]  = 32'hE3A01004; // 0124: MOV R1,#4
    rom[74]  = 32'hE25160FC; // 0128: SUBS R6,R1,#252
    rom[75]  = 32'hCA00000D; // 012C: BGT DONE
    rom[76]  = 32'hE5913000; // 0130: LDR R3,[R1,#0]
    rom[77]  = 32'hE1A02001; // 0134: MOV R2,R1
    rom[78]  = 32'hE0526000; // 0138: SUBS R6,R2,R0
    rom[79]  = 32'hBA000006; // 013C: BLT INSERT_4
    rom[80]  = 32'hE1A04006; // 0140: MOV R4,R6
    rom[81]  = 32'hE5945000; // 0144: LDR R5,[R4,#0]
    rom[82]  = 32'hE0556003; // 0148: SUBS R6,R5,R3
    rom[83]  = 32'hDA000002; // 014C: BLE INSERT_4
    rom[84]  = 32'hE5825000; // 0150: STR R5,[R2,#0]
    rom[85]  = 32'hE1A02004; // 0154: MOV R2,R4
    rom[86]  = 32'hEAFFFFF6; // 0158: B WHILE_4
    rom[87]  = 32'hE5823000; // 015C: STR R3,[R2,#0]
    rom[88]  = 32'hE2811004; // 0160: ADD R1,R1,#4
    rom[89]  = 32'hEAFFFFEF; // 0164: B FOR_4

    rom[90]  = 32'hEAFFFFFE; // 0168: DONE: B DONE

    if (USE_INIT_FILE != 0) begin
        $display("[instr_rom] Loading instruction file: %s", INIT_FILE);
        $readmemh(INIT_FILE, rom);
    end
end

assign instr = rom[pc[ADDR_WIDTH+1:2]];

endmodule // instr_rom
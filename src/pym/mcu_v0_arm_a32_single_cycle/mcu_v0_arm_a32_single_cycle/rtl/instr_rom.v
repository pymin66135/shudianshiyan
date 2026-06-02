//============================================================
// Module: instr_rom
// Description:
//   Simulation instruction ROM.
//   Address is byte address from PC.
//   Word index uses pc[ADDR_WIDTH+1:2].
//   The module contains a built-in V0 demo program. If
//   USE_INIT_FILE is set to 1, it loads INIT_FILE by $readmemh.
//
// Parameters:
//   ADDR_WIDTH   : word address width
//   INIT_FILE    : hex file used by $readmemh
//   USE_INIT_FILE: 1 to load INIT_FILE, 0 to use built-in program
//
// Inputs:
//   pc    : byte address of current instruction
//
// Outputs:
//   instr : 32-bit instruction word
//============================================================

`timescale 1ns/1ps

module instr_rom #(
    parameter ADDR_WIDTH    = 8,
    parameter INIT_FILE     = "program.hex",
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

    // Built-in V0 demo program, identical to program/program.hex.
    // It tests MOV/ADD/SUB/AND/ORR, STR/LDR, B and BL.
    rom[0]  = 32'hE3A00005; // MOV R0, #5
    rom[1]  = 32'hE3A01003; // MOV R1, #3
    rom[2]  = 32'hE0802001; // ADD R2, R0, R1
    rom[3]  = 32'hE0403001; // SUB R3, R0, R1
    rom[4]  = 32'hE0004001; // AND R4, R0, R1
    rom[5]  = 32'hE1805001; // ORR R5, R0, R1
    rom[6]  = 32'hE3A07000; // MOV R7, #0
    rom[7]  = 32'hE5872000; // STR R2, [R7,#0]
    rom[8]  = 32'hE5873004; // STR R3, [R7,#4]
    rom[9]  = 32'hE5874008; // STR R4, [R7,#8]
    rom[10] = 32'hE587500C; // STR R5, [R7,#12]
    rom[11] = 32'hE5976000; // LDR R6, [R7,#0]
    rom[12] = 32'hE2868004; // ADD R8, R6, #4
    rom[13] = 32'hE5878010; // STR R8, [R7,#16]
    rom[14] = 32'hEA000001; // B target, target = PC + 8 + 1*4 = 68
    rom[15] = 32'hE3A09063; // MOV R9, #99, skipped
    rom[16] = 32'hE3A09058; // MOV R9, #88, skipped
    rom[17] = 32'hE2809002; // target: ADD R9, R0, #2
    rom[18] = 32'hEB000001; // BL func, func = PC + 8 + 1*4 = 84
    rom[19] = 32'hE3A0A04D; // MOV R10, #77, skipped by BL
    rom[20] = 32'hE3A0A042; // MOV R10, #66, skipped by BL
    rom[21] = 32'hE280B007; // func: ADD R11, R0, #7
    rom[22] = 32'hE587B014; // STR R11, [R7,#20]
    rom[23] = 32'hE587E018; // STR R14, [R7,#24]

    if (USE_INIT_FILE != 0) begin
        $display("[instr_rom] Loading instruction file: %s", INIT_FILE);
        $readmemh(INIT_FILE, rom);
    end
end

assign instr = rom[pc[ADDR_WIDTH+1:2]];

endmodule // instr_rom

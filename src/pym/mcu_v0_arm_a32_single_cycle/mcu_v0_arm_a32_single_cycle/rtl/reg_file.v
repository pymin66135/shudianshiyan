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

`timescale 1ns/1ps

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

reg [31:0] regs [0:15];
integer i;

assign rd1 = regs[ra1];
assign rd2 = regs[ra2];

assign debug_r0 = regs[0];
assign debug_r1 = regs[1];
assign debug_r2 = regs[2];
assign debug_r3 = regs[3];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for (i = 0; i < 16; i = i + 1) begin
            regs[i] <= 32'b0;
        end
    end else begin
        if (we) begin
            regs[wa] <= wd;
        end
    end
end

endmodule // reg_file

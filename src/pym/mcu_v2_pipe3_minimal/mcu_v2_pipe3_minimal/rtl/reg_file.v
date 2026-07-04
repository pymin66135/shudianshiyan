//============================================================
// Module: reg_file
// Description:
//   16 x 32-bit register file.
//   Two asynchronous read ports and one synchronous write port.
//   V1 adds ARM-style R15 read semantics: reading R15 returns PC+8.
//============================================================

`timescale 1ns/1ps

module reg_file (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] pc_plus8,
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
    output wire [31:0] debug_r3,
    output wire [31:0] debug_r15
);

reg [31:0] regs [0:15];
integer i;

assign rd1 = (ra1 == 4'd15) ? pc_plus8 : regs[ra1];
assign rd2 = (ra2 == 4'd15) ? pc_plus8 : regs[ra2];

assign debug_r0  = regs[0];
assign debug_r1  = regs[1];
assign debug_r2  = regs[2];
assign debug_r3  = regs[3];
assign debug_r15 = pc_plus8;

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

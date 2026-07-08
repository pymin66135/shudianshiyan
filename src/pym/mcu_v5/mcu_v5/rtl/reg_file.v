//============================================================
// Module: reg_file (V3.5)
// Description:
//   Pure 16-depth x 32-bit general-purpose data register file.
//   R0–R15 are ALL data registers — NO PC/SP/LR hardware mapping.
//
//   V3.5 changes vs V2/V3:
//     - pc_plus8 input REMOVED — R15 is no longer PC+8.
//     - 32-bit data width retained.
//     - Same-cycle write-read bypass (forwarding) retained.
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

// Same-cycle bypass: forward write data when reading the
// register being written in the same cycle.
wire bypass1 = we && (wa == ra1);
wire bypass2 = we && (wa == ra2);

assign rd1 = bypass1 ? wd : regs[ra1];
assign rd2 = bypass2 ? wd : regs[ra2];

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

//============================================================
// Module: pc_reg (V3.5 — unchanged)
// Description:
//   Program counter register. PC updates only when pc_enable is high.
//   V3.5: unchanged. PC is a pure sequential element independent of R15.
//============================================================

`timescale 1ns/1ps

module pc_reg (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        pc_enable,
    input  wire [31:0] next_pc,
    output reg  [31:0] pc
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pc <= 32'b0;
    end else if (pc_enable) begin
        pc <= next_pc;
    end
end

endmodule // pc_reg

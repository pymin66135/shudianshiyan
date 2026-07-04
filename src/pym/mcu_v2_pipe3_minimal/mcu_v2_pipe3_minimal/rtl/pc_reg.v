//============================================================
// Module: pc_reg
// Description:
//   Program counter register for ARM A32 subset MCU.
//   V1 removes the old automatic wrap-to-zero logic. The PC is
//   updated only when pc_enable is asserted by the outer top FSM.
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

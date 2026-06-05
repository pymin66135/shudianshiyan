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

`timescale 1ns/1ps

module pc_reg (
    input  wire        clk,
    input  wire        rst_n,
    input  wire [31:0] next_pc,
    output reg  [31:0] pc
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        pc <= 32'b0;
    end 
    else if(pc >= 32'h00000100) begin
        pc <= 32'b0;
    end
    else begin
        pc <= next_pc;
    end
end

endmodule // pc_reg

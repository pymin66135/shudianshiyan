//============================================================
// Module: alu (V3.5)
// Description:
//   32-bit ALU for ARM A32 subset data-processing instructions.
//   V3.5: full 32-bit data path retained; only branch logic removed.
//
// Inputs:
//   a, b       : 32-bit operands
//   alu_op     : ALU operation code
// Outputs:
//   result     : 32-bit ALU result
//   flags_out  : NZCV flags (4-bit)
//============================================================

`timescale 1ns/1ps

module alu (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_op,
    output reg  [31:0] result,
    output reg  [3:0]  flags_out
);

localparam ALU_AND = 4'b0000;
localparam ALU_SUB = 4'b0010;
localparam ALU_ADD = 4'b0100;
localparam ALU_ORR = 4'b1100;
localparam ALU_MOV = 4'b1101;

reg [32:0] add_tmp;
reg [32:0] sub_tmp;
reg        n, z, c, v;

always @(*) begin
    result  = 32'b0;
    add_tmp = 33'b0;
    sub_tmp = 33'b0;
    n = 1'b0; z = 1'b0; c = 1'b0; v = 1'b0;

    case (alu_op)
        ALU_AND: begin
            result = a & b;
        end
        ALU_SUB: begin
            result  = a - b;
            sub_tmp = {1'b0, a} - {1'b0, b};
            c = (a >= b);
            v = (a[31] ^ b[31]) & (a[31] ^ result[31]);
        end
        ALU_ADD: begin
            add_tmp = {1'b0, a} + {1'b0, b};
            result  = add_tmp[31:0];
            c = add_tmp[32];
            v = (~(a[31] ^ b[31])) & (a[31] ^ result[31]);
        end
        ALU_ORR: begin
            result = a | b;
        end
        ALU_MOV: begin
            result = b;
        end
        default: begin
            result = 32'b0;
        end
    endcase

    n = result[31];
    z = (result == 32'b0);
    flags_out = {n, z, c, v};
end

endmodule // alu

//============================================================
// Module: operand2_decode
// Description:
//   Decode ARM A32 Operand2 for data-processing instructions.
//   V0 supports register Rm and immediate imm8 with rotate_imm = 0.
//
// Inputs:
//   instr       : 32-bit A32 instruction
//   rm_value    : register Rm value from register file
//
// Outputs:
//   operand2    : decoded operand2 value
//   unsupported : high when Operand2 format is not supported in V0
//============================================================

`timescale 1ns/1ps

module operand2_decode (
    input  wire [31:0] instr,
    input  wire [31:0] rm_value,
    output reg  [31:0] operand2,
    output reg         unsupported
);

wire is_data_proc = (instr[27:26] == 2'b00);
wire i_bit        = instr[25];
wire [3:0] rotate_imm = instr[11:8];
wire [7:0] imm8       = instr[7:0];
wire [7:0] shift_part = instr[11:4];

always @(*) begin
    operand2    = 32'b0;
    unsupported = 1'b0;

    if (is_data_proc) begin
        if (i_bit) begin
            operand2 = {24'b0, imm8};
            if (rotate_imm != 4'b0000) begin
                unsupported = 1'b1;
            end
        end else begin
            operand2 = rm_value;
            if (shift_part != 8'b00000000) begin
                unsupported = 1'b1;
            end
        end
    end else begin
        operand2    = 32'b0;
        unsupported = 1'b0;
    end
end

endmodule // operand2_decode

`timescale 1ns / 1ps

module alu(
    input [31:0]a,
    input [31:0]b,
    input [1:0]ALUControl,
    output [31:0]Result,
    output [3:0]ALUFlags
    );

wire [31:0]result_sum;   
wire [31:0]result_AND;
wire [31:0]result_OR;
wire [31:0]b_in;
wire carry_;
wire borrow_;
wire overflow_;

// 00 = ADD, 01 = SUB, 10 = AND, 11 = OR

assign b_in = (ALUControl == 2'b00) ? b : ~b; 


adder32_gate u_adder(
    .a(a),
    .b(b_in),
    .result(result_sum),
    .carry(carry_),
    .borrow(borrow_),
    .overflow(overflow_),
    .cin(ALUControl == 2'b00 ? 1'b0 : 1'b1) 
);

assign result_AND = a & b;

assign result_OR = a | b;
// 00 = ADD, 01 = SUB, 10 = AND, 11 = OR

assign Result = (ALUControl == 2'b10) ? result_AND :
             (ALUControl == 2'b11) ? result_OR :
             result_sum; // default for add/sub

wire zero;
wire negative;
wire carry;
wire overflow;

assign zero = (Result == 32'b0);
assign negative  = Result[31]; 

assign carry = (ALUControl == 2'b00 || ALUControl == 2'b01) ? carry_ : 1'b0;
assign overflow = (ALUControl == 2'b00 || ALUControl == 2'b01) ? overflow_ : 1'b0;

// NZCV
assign ALUFlags = {negative, zero, carry, overflow};

endmodule

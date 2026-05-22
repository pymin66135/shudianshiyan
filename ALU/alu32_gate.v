`timescale 1ns / 1ps

module alu32_gate(
    input [31:0]A,
    input [31:0]B,
    input [1:0]op,
    output [31:0]result,
    output zero,
    output negative,
    output carry,
    output borrow,
    output overflow
    );

wire [31:0]result_sum;   
wire [31:0]result_AND;
wire [31:0]result_OR;
wire [31:0]b;
wire carry_;
wire borrow_;
wire overflow_;

// `00 = ADD`，`01 = SUB`，`10 = AND`，`11 = OR`

assign b = (op == 2'b00) ? B : ~B; 


adder32_gate u_adder(
    .a(A),
    .b(b),
    .result(result_sum),
    .carry(carry_),
    .borrow(borrow_),
    .overflow(overflow_),
    .cin(op == 2'b00 ? 1'b0 : 1'b1) 
);

assign result_AND = A & B;

assign result_OR = A | B;
// `00 = ADD`，`01 = SUB`，`10 = AND`，`11 = OR`

assign result = (op == 2'b10) ? result_AND :
             (op == 2'b11) ? result_OR :
             result_sum; // 剩下默认

assign zero = (result == 32'b0);
assign negative  = result[31]; 

assign carry = (op == 2'b00 || op == 2'b01) ? carry_ : 1'b0;
assign overflow = (op == 2'b00 || op == 2'b01) ? overflow_ : 1'b0;
assign borrow = (op == 2'b01) ? borrow_ : 1'b0;

endmodule

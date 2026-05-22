`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/04/20 16:09:28
// Design Name: 
// Module Name: FullAdder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder_1bit(
    input A,         // ?? A
    input B,         // ?? B
    input C,
    output sum,      // ?? sum    ?
    output carry
);


assign sum = A ^ B ^ C;      // ????????? A ? B ??

assign carry = (A & B) | ((A ^ B) & C);    // ???????? A ? B ???
    

endmodule

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Company: 

// Engineer: 

// 

// Create Date: 2026/04/24 10:55:28

// Design Name: 

module adder32_gate(

    input [31:0]a,
    input [31:0]b,
    input cin,
    output [31:0]result,
    output carry,
    output borrow,
    output overflow
    );

    wire [31:0]sum;
    wire [32:0]c;

    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : gen_full_adders
            full_adder_1bit u_fa(
                .A(a[i]),
                .B(b[i]),
                .C(c[i]),
                .sum(sum[i]),
                .carry(c[i + 1])
            );
        end
    endgenerate

    assign result = sum;
    assign carry = c[32];
    assign overflow = c[31] ^ c[32];
    assign borrow = ~c[32]; 

endmodule

    


`timescale 1ns / 1ps

module tb_adder32_gate;
    reg [31:0] a;
    reg [31:0] b;
    wire [31:0] result;
    wire carry;
    wire borrow;
    wire overflow;

    
    adder32_gate dut(
        .a(a),
        .b(b),
        .result(result),
        .carry(carry),
        .borrow(borrow),
        .overflow(overflow)
    );

    initial begin


        a = 32'h0000_0000; b = 32'h0000_0000; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h0000_0001; b = 32'h0000_0001; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h0000_0001; b = 32'hFFFF_FFFF; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h7FFF_FFFF; b = 32'h0000_0001; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h8000_0000; b = 32'h8000_0000; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'hFFFF_FFFF; b = 32'h0000_0001; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'hFFFF_FFFE; b = 32'h0000_0001; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h0000_0000; b = 32'hFFFF_FFFF; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'h1234_5678; b = 32'h8765_4321; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);

        a = 32'hAAAA_AAAA; b = 32'h5555_5555; #1;
        $display("a=%h b=%h result=%h carry=%b borrow=%b overflow=%b", a, b, result, carry, borrow, overflow);


        $finish;
    end
endmodule

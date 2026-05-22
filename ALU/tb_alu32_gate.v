/*
 * ???????
 * 1. ?????????????????????? (A, B, op) ????? (result, zero, negative, carry, borrow, overflow)?
 * 2. ????????????? alu32_gate?????????????????
 * 3. ???????? (initial?)?
 * - ???? (op=00): 12?????0???????????
 * - ???? (op=01): 10???????????????????
 * - AND???? (op=10): 8???????????
 * - OR???? (op=11): 8???????????
 */

`timescale 1ns / 1ps

module tb_alu32_gate();

    // 1. ???? (?????? A ? B)
    reg  [31:0] A;
    reg  [31:0] B;
    reg  [1:0]  op;
    
    wire [31:0] result;
    wire        zero;
    wire        negative;
    wire        carry;
    wire        borrow;
    wire        overflow;

    // 2. ?????
    alu32_gate u_alu32_gate (
        .A(A),
        .B(B),
        .op(op),
        .result(result),
        .zero(zero),
        .negative(negative),
        .carry(carry),
        .borrow(borrow),
        .overflow(overflow)
    );

    // 3. ????????
    initial begin
        // ?????
        A = 32'b0;
        B = 32'b0;
        op = 2'b00;
        #10; // ??????

        // ==========================================
        // 1. ???? (op = 2'b00) - ????12?
        // ==========================================
        op = 2'b00;
        $display("--- ADD Tests ---");
        
        A = 32'h0000_0000; B = 32'h0000_0000; #10; // 0+0 (?Zero)
        $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0001; B = 32'h0000_0001; #10; // 1+1 (????)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0001; B = 32'hFFFF_FFFF; #10; // 1+(-1) (??????Carry)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h7FFF_FFFF; B = 32'h0000_0001; #10; // ????+1 (???? V=1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h8000_0000; B = 32'h8000_0000; #10; // ????+???? (???? V=1, C=1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'h0000_0001; #10; // -1+1 (??1???????)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFE; B = 32'h0000_0001; #10; // -2+1
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0000; B = 32'hFFFF_FFFF; #10; // 0+(-1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h1234_5678; B = 32'h8765_4321; #10; // ????????
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hAAAA_AAAA; B = 32'h5555_5555; #10; // ?????? (??F)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);
        
        A = 32'h7FFF_FFFF; B = 32'h7FFF_FFFF; #10; // ????+???? (???)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);
        
        A = 32'h8000_0000; B = 32'hFFFF_FFFF; #10; // ????+(-1) (???)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);


        // ==========================================
        // 2. ???? (op = 2'b01) - ????10?
        // ==========================================
        op = 2'b01;
        $display("\n--- SUB Tests ---");
        
        A = 32'h0000_0000; B = 32'h0000_0000; #10; // 0-0 (?Zero)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0005; B = 32'h0000_0003; #10; // 5-3 (???????)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0003; B = 32'h0000_0005; #10; // 3-5 (?????Borrow)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h8000_0000; B = 32'h0000_0001; #10; // ????-1 (???? V=1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h7FFF_FFFF; B = 32'hFFFF_FFFF; #10; // ????-(-1) (???? V=1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'hFFFF_FFFF; #10; // -1 - (-1)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0000; B = 32'h0000_0001; #10; // 0-1 (??1??)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h8000_0000; B = 32'h8000_0000; #10; // ????? (?0)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hAAAA_AAAA; B = 32'h5555_5555; #10; // ????
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h5555_5555; B = 32'hAAAA_AAAA; #10; // ???????
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);


        // ==========================================
        // 3. AND ???? (op = 2'b10) - ????????
        // ==========================================
        op = 2'b10;
        $display("\n--- AND Logic Tests ---");
        
        A = 32'h0000_0000; B = 32'h0000_0000; #10; // ?0 & ?0
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'hFFFF_FFFF; #10; // ?1 & ?1
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0000; B = 32'hFFFF_FFFF; #10; // ?0 & ?1
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'h0000_0000; #10; // ?1 & ?0
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hAAAA_AAAA; B = 32'h5555_5555; #10; // 1010?0101???? (?????0)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hF0F0_F0F0; B = 32'h0F0F_0F0F; #10; // 4????? (?????0)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFF00_FF00; B = 32'h00FF_00FF; #10; // 8????? (?????0)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h1234_5678; B = 32'h1234_5678; #10; // ????????? (?????)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);


        // ==========================================
        // 4. OR ???? (op = 2'b11) - ????????
        // ==========================================
        op = 2'b11;
        $display("\n--- OR Logic Tests ---");
        
        A = 32'h0000_0000; B = 32'h0000_0000; #10; 
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'hFFFF_FFFF; #10; 
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h0000_0000; B = 32'hFFFF_FFFF; #10; 
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFFFF_FFFF; B = 32'h0000_0000; #10; 
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hAAAA_AAAA; B = 32'h5555_5555; #10; // 1010?0101 (????FFFF_FFFF)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hF0F0_F0F0; B = 32'h0F0F_0F0F; #10; // 4????? (????FFFF_FFFF)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'hFF00_FF00; B = 32'h00FF_00FF; #10; // 8????? (????FFFF_FFFF)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        A = 32'h1234_5678; B = 32'h1234_5678; #10; // ????????? (?????)
      $display("op=%b A=%h B=%h res=%h Zero=%b Negative=%b Carry=%b Borrow=%b Overflow=%b", op, A, B, result, zero, negative, carry, borrow, overflow);

        // ????
        #10 $finish;
    end

endmodule
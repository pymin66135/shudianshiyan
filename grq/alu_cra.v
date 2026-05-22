`timescale 1ns / 1ps

//============================================================
// 1-bit 2-to-1 multiplexer
// y = sel ? d1 : d0
//============================================================
module mux2 (
    input  d0,
    input  d1,
    input  sel,
    output y
);

    wire nsel;
    wire w0;
    wire w1;

    not u_not_sel (nsel, sel);

    and u_and0 (w0, d0, nsel);
    and u_and1 (w1, d1, sel);

    or  u_or0  (y, w0, w1);

endmodule


//============================================================
// 4-bit Carry Lookahead Adder
//
// P[i] = A[i] ^ B[i]
// G[i] = A[i] & B[i]
//
// C1 = G0 + P0*C0
// C2 = G1 + P1*G0 + P1*P0*C0
// C3 = G2 + P2*G1 + P2*P1*G0 + P2*P1*P0*C0
// C4 = G3 + P3*G2 + P3*P2*G1 + P3*P2*P1*G0 + P3*P2*P1*P0*C0
//============================================================
module cla4 (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout,
    output       CarryIntoMSB,
    output       P_group,
    output       G_group
);

    wire [3:0] P;
    wire [3:0] G;

    wire c1;
    wire c2;
    wire c3;
    wire c4;

    assign P = A ^ B;
    assign G = A & B;

    assign c1 = G[0] | (P[0] & Cin);

    assign c2 = G[1] |
                (P[1] & G[0]) |
                (P[1] & P[0] & Cin);

    assign c3 = G[2] |
                (P[2] & G[1]) |
                (P[2] & P[1] & G[0]) |
                (P[2] & P[1] & P[0] & Cin);

    assign c4 = G[3] |
                (P[3] & G[2]) |
                (P[3] & P[2] & G[1]) |
                (P[3] & P[2] & P[1] & G[0]) |
                (P[3] & P[2] & P[1] & P[0] & Cin);

    assign Sum[0] = P[0] ^ Cin;
    assign Sum[1] = P[1] ^ c1;
    assign Sum[2] = P[2] ^ c2;
    assign Sum[3] = P[3] ^ c3;

    assign Cout = c4;

    // 进入最高位 bit3 的进位，用于最高位所在块时计算 overflow
    assign CarryIntoMSB = c3;

    // 4-bit group propagate and generate
    assign P_group = P[3] & P[2] & P[1] & P[0];

    assign G_group = G[3] |
                     (P[3] & G[2]) |
                     (P[3] & P[2] & G[1]) |
                     (P[3] & P[2] & P[1] & G[0]);

endmodule


//============================================================
// 32-bit Carry Lookahead Adder
//
// 由 8 个 4-bit CLA 组成。
// 组间进位也用超前进位公式产生，而不是简单一级一级 ripple。
//============================================================
module cla_adder32 (
    input  [31:0] A,
    input  [31:0] B,
    input         Cin,
    output [31:0] Sum,
    output        Cout,
    output        Overflow
);

    wire [7:0] P_group;
    wire [7:0] G_group;

    wire [8:0] C_group;

    wire carry_into_msb;

    assign C_group[0] = Cin;

    // 组间超前进位
    assign C_group[1] = G_group[0] |
                        (P_group[0] & C_group[0]);

    assign C_group[2] = G_group[1] |
                        (P_group[1] & G_group[0]) |
                        (P_group[1] & P_group[0] & C_group[0]);

    assign C_group[3] = G_group[2] |
                        (P_group[2] & G_group[1]) |
                        (P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    assign C_group[4] = G_group[3] |
                        (P_group[3] & G_group[2]) |
                        (P_group[3] & P_group[2] & G_group[1]) |
                        (P_group[3] & P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[3] & P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    assign C_group[5] = G_group[4] |
                        (P_group[4] & G_group[3]) |
                        (P_group[4] & P_group[3] & G_group[2]) |
                        (P_group[4] & P_group[3] & P_group[2] & G_group[1]) |
                        (P_group[4] & P_group[3] & P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[4] & P_group[3] & P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    assign C_group[6] = G_group[5] |
                        (P_group[5] & G_group[4]) |
                        (P_group[5] & P_group[4] & G_group[3]) |
                        (P_group[5] & P_group[4] & P_group[3] & G_group[2]) |
                        (P_group[5] & P_group[4] & P_group[3] & P_group[2] & G_group[1]) |
                        (P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    assign C_group[7] = G_group[6] |
                        (P_group[6] & G_group[5]) |
                        (P_group[6] & P_group[5] & G_group[4]) |
                        (P_group[6] & P_group[5] & P_group[4] & G_group[3]) |
                        (P_group[6] & P_group[5] & P_group[4] & P_group[3] & G_group[2]) |
                        (P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & G_group[1]) |
                        (P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    assign C_group[8] = G_group[7] |
                        (P_group[7] & G_group[6]) |
                        (P_group[7] & P_group[6] & G_group[5]) |
                        (P_group[7] & P_group[6] & P_group[5] & G_group[4]) |
                        (P_group[7] & P_group[6] & P_group[5] & P_group[4] & G_group[3]) |
                        (P_group[7] & P_group[6] & P_group[5] & P_group[4] & P_group[3] & G_group[2]) |
                        (P_group[7] & P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & G_group[1]) |
                        (P_group[7] & P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & G_group[0]) |
                        (P_group[7] & P_group[6] & P_group[5] & P_group[4] & P_group[3] & P_group[2] & P_group[1] & P_group[0] & C_group[0]);

    cla4 u_cla4_0 (
        .A(A[3:0]),
        .B(B[3:0]),
        .Cin(C_group[0]),
        .Sum(Sum[3:0]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[0]),
        .G_group(G_group[0])
    );

    cla4 u_cla4_1 (
        .A(A[7:4]),
        .B(B[7:4]),
        .Cin(C_group[1]),
        .Sum(Sum[7:4]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[1]),
        .G_group(G_group[1])
    );

    cla4 u_cla4_2 (
        .A(A[11:8]),
        .B(B[11:8]),
        .Cin(C_group[2]),
        .Sum(Sum[11:8]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[2]),
        .G_group(G_group[2])
    );

    cla4 u_cla4_3 (
        .A(A[15:12]),
        .B(B[15:12]),
        .Cin(C_group[3]),
        .Sum(Sum[15:12]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[3]),
        .G_group(G_group[3])
    );

    cla4 u_cla4_4 (
        .A(A[19:16]),
        .B(B[19:16]),
        .Cin(C_group[4]),
        .Sum(Sum[19:16]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[4]),
        .G_group(G_group[4])
    );

    cla4 u_cla4_5 (
        .A(A[23:20]),
        .B(B[23:20]),
        .Cin(C_group[5]),
        .Sum(Sum[23:20]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[5]),
        .G_group(G_group[5])
    );

    cla4 u_cla4_6 (
        .A(A[27:24]),
        .B(B[27:24]),
        .Cin(C_group[6]),
        .Sum(Sum[27:24]),
        .Cout(),
        .CarryIntoMSB(),
        .P_group(P_group[6]),
        .G_group(G_group[6])
    );

    cla4 u_cla4_7 (
        .A(A[31:28]),
        .B(B[31:28]),
        .Cin(C_group[7]),
        .Sum(Sum[31:28]),
        .Cout(),
        .CarryIntoMSB(carry_into_msb),
        .P_group(P_group[7]),
        .G_group(G_group[7])
    );

    assign Cout = C_group[8];

    // 有符号溢出：最高位进位输入 xor 最高位进位输出
    assign Overflow = carry_into_msb ^ C_group[8];

endmodule


//============================================================
// 32-bit ALU
//
// ALUControl:
// 00: ADD
// 01: SUB
// 10: AND
// 11: OR
//
// ALUFlags = {N, Z, C, V}
// N: Negative
// Z: Zero
// C: Carry
// V: Overflow
//============================================================
module alu (
    input  [31:0] a,
    input  [31:0] b,
    input  [1:0]  ALUControl,
    output [31:0] Result,
    output [3:0]  ALUFlags
);

    wire is_sub;
    wire is_logic;

    wire [31:0] b_eff;
    wire [31:0] addsub_result;
    wire [31:0] and_result;
    wire [31:0] or_result;
    wire [31:0] logic_result;

    wire cout_addsub;
    wire overflow_addsub;

    wire negative_flag;
    wire zero_flag;
    wire carry_flag;
    wire overflow_flag;

    wire not_is_logic;

    // is_sub = 1 only when ALUControl = 01
    not u_not_logic (not_is_logic, ALUControl[1]);
    and u_and_sub   (is_sub, not_is_logic, ALUControl[0]);

    // ALUControl[1] = 0: ADD/SUB
    // ALUControl[1] = 1: AND/OR
    assign is_logic = ALUControl[1];

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : ALU_BIT_LOGIC

            and u_and_result (and_result[i], a[i], b[i]);

            or  u_or_result  (or_result[i], a[i], b[i]);

            // ADD: is_sub = 0, b_eff = b
            // SUB: is_sub = 1, b_eff = ~b
            xor u_xor_beff   (b_eff[i], b[i], is_sub);

        end
    endgenerate

    // 使用 32-bit 超前进位加法器实现 ADD/SUB
    // ADD: a + b + 0
    // SUB: a + ~b + 1
    cla_adder32 u_cla_adder32 (
        .A        (a),
        .B        (b_eff),
        .Cin      (is_sub),
        .Sum      (addsub_result),
        .Cout     (cout_addsub),
        .Overflow (overflow_addsub)
    );

    // 逻辑运算选择：10 -> AND, 11 -> OR
    generate
        for (i = 0; i < 32; i = i + 1) begin : LOGIC_MUX

            mux2 u_logic_mux (
                .d0  (and_result[i]),
                .d1  (or_result[i]),
                .sel (ALUControl[0]),
                .y   (logic_result[i])
            );

        end
    endgenerate

    // 最终选择：ADD/SUB 或 AND/OR
    generate
        for (i = 0; i < 32; i = i + 1) begin : FINAL_MUX

            mux2 u_final_mux (
                .d0  (addsub_result[i]),
                .d1  (logic_result[i]),
                .sel (is_logic),
                .y   (Result[i])
            );

        end
    endgenerate

    // N flag: 结果最高位
    assign negative_flag = Result[31];

    // Z flag: 结果全 0
    nor u_zero_flag (
        zero_flag,
        Result[0],  Result[1],  Result[2],  Result[3],
        Result[4],  Result[5],  Result[6],  Result[7],
        Result[8],  Result[9],  Result[10], Result[11],
        Result[12], Result[13], Result[14], Result[15],
        Result[16], Result[17], Result[18], Result[19],
        Result[20], Result[21], Result[22], Result[23],
        Result[24], Result[25], Result[26], Result[27],
        Result[28], Result[29], Result[30], Result[31]
    );

    // ADD/SUB 时 C 有意义，AND/OR 时 C = 0
    and u_carry_flag (carry_flag, cout_addsub, not_is_logic);

    // ADD/SUB 时 V 有意义，AND/OR 时 V = 0
    and u_overflow_flag (overflow_flag, overflow_addsub, not_is_logic);

    assign ALUFlags[3] = negative_flag;
    assign ALUFlags[2] = zero_flag;
    assign ALUFlags[1] = carry_flag;
    assign ALUFlags[0] = overflow_flag;

endmodule
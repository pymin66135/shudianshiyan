//============================================================
// Module: tb_top_v5_32core
// Description: V5.2 32-core behavioral testbench with deterministic signed data.
//============================================================
`timescale 1ns/1ps

module tb_top_v5_32core;
    localparam N_DATA = 64;
    localparam [31:0] DONE_PC = 32'h000001F8;
    reg clk_osc;
    reg rst;
    integer timeout, i, j;
    reg signed [15:0] result [0:N_DATA-1];
    reg signed [15:0] golden [0:N_DATA-1];
    reg signed [15:0] tmp;
    integer err_cnt;

    initial begin clk_osc = 1'b0; forever #5 clk_osc = ~clk_osc; end

    top #(
        .DONE_PC_CORE00(DONE_PC),
        .DONE_PC_CORE01(DONE_PC),
        .DONE_PC_CORE02(DONE_PC),
        .DONE_PC_CORE03(DONE_PC),
        .DONE_PC_CORE04(DONE_PC),
        .DONE_PC_CORE05(DONE_PC),
        .DONE_PC_CORE06(DONE_PC),
        .DONE_PC_CORE07(DONE_PC),
        .DONE_PC_CORE08(DONE_PC),
        .DONE_PC_CORE09(DONE_PC),
        .DONE_PC_CORE10(DONE_PC),
        .DONE_PC_CORE11(DONE_PC),
        .DONE_PC_CORE12(DONE_PC),
        .DONE_PC_CORE13(DONE_PC),
        .DONE_PC_CORE14(DONE_PC),
        .DONE_PC_CORE15(DONE_PC),
        .DONE_PC_CORE16(DONE_PC),
        .DONE_PC_CORE17(DONE_PC),
        .DONE_PC_CORE18(DONE_PC),
        .DONE_PC_CORE19(DONE_PC),
        .DONE_PC_CORE20(DONE_PC),
        .DONE_PC_CORE21(DONE_PC),
        .DONE_PC_CORE22(DONE_PC),
        .DONE_PC_CORE23(DONE_PC),
        .DONE_PC_CORE24(DONE_PC),
        .DONE_PC_CORE25(DONE_PC),
        .DONE_PC_CORE26(DONE_PC),
        .DONE_PC_CORE27(DONE_PC),
        .DONE_PC_CORE28(DONE_PC),
        .DONE_PC_CORE29(DONE_PC),
        .DONE_PC_CORE30(DONE_PC),
        .DONE_PC_CORE31(DONE_PC)
    ) dut (.clk_osc(clk_osc), .rst(rst));

    task init_case;
        begin
            golden[0] = 16'sd0;
            golden[1] = 16'sd32767;
            golden[2] = -16'sd32768;
            golden[3] = 16'sd5;
            golden[4] = -16'sd1;
            golden[5] = 16'sd13;
            golden[6] = -16'sd7;
            golden[7] = 16'sd2048;
            golden[8] = -16'sd2048;
            golden[9] = 16'sd999;
            golden[10] = -16'sd999;
            golden[11] = 16'sd123;
            golden[12] = -16'sd123;
            golden[13] = 16'sd42;
            golden[14] = -16'sd42;
            golden[15] = 16'sd7;
            golden[16] = 16'sd6;
            golden[17] = 16'sd5;
            golden[18] = 16'sd4;
            golden[19] = 16'sd3;
            golden[20] = 16'sd2;
            golden[21] = 16'sd1;
            golden[22] = 16'sd0;
            golden[23] = -16'sd1;
            golden[24] = -16'sd2;
            golden[25] = -16'sd3;
            golden[26] = -16'sd4;
            golden[27] = -16'sd5;
            golden[28] = -16'sd6;
            golden[29] = -16'sd7;
            golden[30] = -16'sd8;
            golden[31] = -16'sd9;
            golden[32] = 16'sd30000;
            golden[33] = -16'sd30000;
            golden[34] = 16'sd16384;
            golden[35] = -16'sd16384;
            golden[36] = 16'sd1111;
            golden[37] = -16'sd1111;
            golden[38] = 16'sd2222;
            golden[39] = -16'sd2222;
            golden[40] = 16'sd3333;
            golden[41] = -16'sd3333;
            golden[42] = 16'sd4444;
            golden[43] = -16'sd4444;
            golden[44] = 16'sd5555;
            golden[45] = -16'sd5555;
            golden[46] = 16'sd6666;
            golden[47] = -16'sd6666;
            golden[48] = 16'sd15;
            golden[49] = 16'sd15;
            golden[50] = -16'sd15;
            golden[51] = -16'sd15;
            golden[52] = 16'sd100;
            golden[53] = -16'sd100;
            golden[54] = 16'sd50;
            golden[55] = -16'sd50;
            golden[56] = 16'sd25;
            golden[57] = -16'sd25;
            golden[58] = 16'sd12;
            golden[59] = -16'sd12;
            golden[60] = 16'sd1;
            golden[61] = -16'sd1;
            golden[62] = 16'sd0;
            golden[63] = 16'sd0;
            for (i = 0; i < N_DATA-1; i = i + 1) begin
                for (j = 0; j < N_DATA-1-i; j = j + 1) begin
                    if (golden[j] > golden[j+1]) begin
                        tmp = golden[j]; golden[j] = golden[j+1]; golden[j+1] = tmp;
                    end
                end
            end
        end
    endtask

    always @(posedge clk_osc) begin
        if (dut.verify_ram_ena) result[dut.verify_ram_addr_a] <= dut.verify_vector_out_a;
    end

    initial begin
        $display("============================================================");
        $display(" V5.2 32-Core Testbench");
        $display("============================================================");
        init_case();
        rst = 1'b1; #100; rst = 1'b0; timeout = 0;
        while (dut.done !== 1'b1 && timeout < 50000) begin
            @(posedge clk_osc); timeout = timeout + 1;
            if ((timeout % 5000) == 0)
                $display("  [%0d] running... cnt_test=%0d", timeout, dut.cnt_test);
        end
        $display("\n============================================================");
        if (dut.done !== 1'b1) begin
            $display(" * FAILED * Timeout after %0d cycles!", timeout);
        end else begin
            $display(" Sorting completed. Cycles=%0d (cnt_test=%0d)", timeout, dut.cnt_test);
            err_cnt = 0;
            for (i = 0; i < N_DATA; i = i + 1) begin
                if (result[i] !== golden[i]) begin
                    if (err_cnt < 20) $display("  DATA ERR [%0d]: got %0d, expect %0d", i, result[i], golden[i]);
                    err_cnt = err_cnt + 1;
                end
            end
            for (i = 0; i < N_DATA-1; i = i + 1) begin
                if (result[i] > result[i+1]) begin
                    if (err_cnt < 20) $display("  ORDER ERR [%0d]: %0d > [%0d]: %0d", i, result[i], i+1, result[i+1]);
                    err_cnt = err_cnt + 1;
                end
            end
            if (err_cnt == 0) $display(" * PASS * : All %0d elements match signed golden order!", N_DATA);
            else $display(" * FAILED * : %0d errors!", err_cnt);
        end
        $display("============================================================");
        $finish;
    end
endmodule

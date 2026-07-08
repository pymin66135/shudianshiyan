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
        reg signed [15:0] test_input [0:N_DATA-1];
        begin
            // ============================================
            // Step 1: Define unsorted input data
            // ============================================
            test_input[0] = 16'sd0;
            test_input[1] = 16'sd32767;
            test_input[2] = -16'sd32768;
            test_input[3] = 16'sd5;
            test_input[4] = -16'sd1;
            test_input[5] = 16'sd13;
            test_input[6] = -16'sd7;
            test_input[7] = 16'sd2048;
            test_input[8] = -16'sd2048;
            test_input[9] = 16'sd999;
            test_input[10] = -16'sd999;
            test_input[11] = 16'sd123;
            test_input[12] = -16'sd123;
            test_input[13] = 16'sd42;
            test_input[14] = -16'sd42;
            test_input[15] = 16'sd7;
            test_input[16] = 16'sd6;
            test_input[17] = 16'sd5;
            test_input[18] = 16'sd4;
            test_input[19] = 16'sd3;
            test_input[20] = 16'sd2;
            test_input[21] = 16'sd1;
            test_input[22] = 16'sd0;
            test_input[23] = -16'sd1;
            test_input[24] = -16'sd2;
            test_input[25] = -16'sd3;
            test_input[26] = -16'sd4;
            test_input[27] = -16'sd5;
            test_input[28] = -16'sd6;
            test_input[29] = -16'sd7;
            test_input[30] = -16'sd8;
            test_input[31] = -16'sd9;
            test_input[32] = 16'sd30000;
            test_input[33] = -16'sd30000;
            test_input[34] = 16'sd16384;
            test_input[35] = -16'sd16384;
            test_input[36] = 16'sd1111;
            test_input[37] = -16'sd1111;
            test_input[38] = 16'sd2222;
            test_input[39] = -16'sd2222;
            test_input[40] = 16'sd3333;
            test_input[41] = -16'sd3333;
            test_input[42] = 16'sd4444;
            test_input[43] = -16'sd4444;
            test_input[44] = 16'sd5555;
            test_input[45] = -16'sd5555;
            test_input[46] = 16'sd6666;
            test_input[47] = -16'sd6666;
            test_input[48] = 16'sd15;
            test_input[49] = 16'sd15;
            test_input[50] = -16'sd15;
            test_input[51] = -16'sd15;
            test_input[52] = 16'sd100;
            test_input[53] = -16'sd100;
            test_input[54] = 16'sd50;
            test_input[55] = -16'sd50;
            test_input[56] = 16'sd25;
            test_input[57] = -16'sd25;
            test_input[58] = 16'sd12;
            test_input[59] = -16'sd12;
            test_input[60] = 16'sd1;
            test_input[61] = -16'sd1;
            test_input[62] = 16'sd0;
            test_input[63] = 16'sd0;

            // ============================================
            // Step 2: Backdoor-load into test_ROM via task
            // ============================================
            for (i = 0; i < N_DATA; i = i + 1) begin
                dut.u_test_ROM.backdoor_write(i[5:0], test_input[i]);
            end
            $display(" [INIT] Backdoor-loaded %0d words into test_ROM", N_DATA);

            // ============================================
            // Step 3: Copy to golden & bubble-sort
            // ============================================
            for (i = 0; i < N_DATA; i = i + 1) begin
                golden[i] = test_input[i];
            end
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

    // ============================================
    // Debug: monitor load-phase GPRF writes
    // ============================================
    always @(posedge clk_osc) begin
        if (dut.state == 3'd1 && dut.load_write_valid) begin  // ST_LOAD_STREAM
            $display(" [LOAD] GPRF[%0d]<=%04h  GPRF[%0d]<=%04h  (pipe1_addr=%0d)",
                dut.load_addr_pipe1, dut.load_data_pipe1_a,
                dut.load_addr_pipe1 + 6'd1, dut.load_data_pipe1_b,
                dut.load_addr_pipe1);
        end
        if (dut.state == 3'd1 && dut.load_all_issued)
            $display(" [LOAD] load_all_issued=1, load_write_done=%0d, load_index=%0d",
                dut.load_write_done, dut.load_index);
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

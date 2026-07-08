//============================================================
// Module: tb_top_v5_16core
// Description:
//   V5.0 16-core simple testbench (no backdoor access).
//   Uses COE-initialized test_ROM, waits for ST_DONE,
//   reads verify_RAM port to check sorted order.
//============================================================

`timescale 1ns/1ps

module tb_top_v5_16core;

    localparam N_DATA = 64;
    localparam [31:0] DONE_PC = 32'h000003A8;

    reg clk_osc;
    reg rst;
    integer timeout, i;
    reg [15:0] result [0:N_DATA-1];
    integer err_cnt;

    initial begin
        clk_osc = 1'b0;
        forever #5 clk_osc = ~clk_osc;
    end

    // DUT
    top #(
        .DONE_PC_CORE00(DONE_PC), .DONE_PC_CORE01(DONE_PC), .DONE_PC_CORE02(DONE_PC), .DONE_PC_CORE03(DONE_PC),
        .DONE_PC_CORE04(DONE_PC), .DONE_PC_CORE05(DONE_PC), .DONE_PC_CORE06(DONE_PC), .DONE_PC_CORE07(DONE_PC),
        .DONE_PC_CORE08(DONE_PC), .DONE_PC_CORE09(DONE_PC), .DONE_PC_CORE10(DONE_PC), .DONE_PC_CORE11(DONE_PC),
        .DONE_PC_CORE12(DONE_PC), .DONE_PC_CORE13(DONE_PC), .DONE_PC_CORE14(DONE_PC), .DONE_PC_CORE15(DONE_PC)
    ) dut (
        .clk_osc(clk_osc), .rst(rst)
    );

    // Sample the data being WRITTEN to verify_RAM (= sorted global_rf data).
    // Dual-port top writes two adjacent elements per ST_WRITE cycle.
    always @(posedge clk_osc) begin
        if (dut.verify_ram_ena) begin
            result[dut.verify_ram_addr_a] <= dut.verify_vector_out_a;
        end
        if (dut.verify_ram_enb) begin
            result[dut.verify_ram_addr_b] <= dut.verify_vector_out_b;
        end
    end

    initial begin
        $display("============================================================");
        $display(" V5.0 16-Core Testbench (COE data)");
        $display("============================================================");

        rst = 1'b1;
        #100;
        rst = 1'b0;
        timeout = 0;

        while (dut.done !== 1'b1 && timeout < 50000) begin
            @(posedge clk_osc);
            timeout = timeout + 1;
            if ((timeout % 10000) == 0) begin
                $display("  [%0d] running... cores_done=%b_%b_%b_%b",
                    timeout,
                    {dut.core_done15, dut.core_done14, dut.core_done13, dut.core_done12},
                    {dut.core_done11, dut.core_done10, dut.core_done9,  dut.core_done8},
                    {dut.core_done7,  dut.core_done6,  dut.core_done5,  dut.core_done4},
                    {dut.core_done3,  dut.core_done2,  dut.core_done1,  dut.core_done0});
            end
        end

        $display("\n============================================================");
        if (dut.done !== 1'b1) begin
            $display(" * FAILED * Timeout after %0d cycles!", timeout);
            $display("  C00:0x%08h C01:0x%08h C02:0x%08h C03:0x%08h", dut.debug_pc0, dut.debug_pc1, dut.debug_pc2, dut.debug_pc3);
            $display("  C04:0x%08h C05:0x%08h C06:0x%08h C07:0x%08h", dut.debug_pc4, dut.debug_pc5, dut.debug_pc6, dut.debug_pc7);
            $display("  C08:0x%08h C09:0x%08h C10:0x%08h C11:0x%08h", dut.debug_pc8, dut.debug_pc9, dut.debug_pc10, dut.debug_pc11);
            $display("  C12:0x%08h C13:0x%08h C14:0x%08h C15:0x%08h", dut.debug_pc12, dut.debug_pc13, dut.debug_pc14, dut.debug_pc15);
        end else begin
            $display(" Sorting completed. Cycles=%0d (cnt_test=%0d)", timeout, dut.cnt_test);

            // Check ascending order from sampled verify_RAM outputs
            err_cnt = 0;
            for (i = 0; i < N_DATA - 1; i = i + 1) begin
                if ($signed(result[i]) > $signed(result[i+1])) begin
                    if (err_cnt < 10)
                        $display("  ORDER ERR [%0d]: %0d > [%0d]: %0d", i, $signed(result[i]), i+1, $signed(result[i+1]));
                    err_cnt = err_cnt + 1;
                end
            end

            if (err_cnt == 0)
                $display(" * PASS * : All %0d elements in ascending order!", N_DATA);
            else
                $display(" * FAILED * : %0d ordering errors!", err_cnt);
        end
        $display("============================================================");
        $finish;
    end

endmodule

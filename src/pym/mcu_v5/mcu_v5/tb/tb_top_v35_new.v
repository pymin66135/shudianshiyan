//============================================================
// V3.6 Advanced Testbench (Auto Data Generation & Verification)
// ???????
// 1. ??????? (Parameters & Signals): ???????????????????????????
// 2. ?????????? (Dynamic Dataset Injection): 
//    ??? 0 ???????????? 64 ?????Signed 16-bit?????????
//    ??????????? Expected ????????????????????????? test_ROM?
// 3. ??? DUT ??? (Clock & DUT): ?? 100MHz ????????? top?
// 4. ?????? (Main Control Flow): ?????????????????????????
// 5. ??????? (Automated Result Verification): ? FSM ?? ST_DONE ??
//    ???? verify_RAM??????????????????????? Pass/Fail ???
//============================================================

`timescale 1ns/1ps

module tb_top_v35_simple;

//------------------------------------------------------------
// ???? (?? V3.6 ?????? PC ???)
//------------------------------------------------------------
localparam [31:0] DONE_PC0 = 32'h00000A3C;
localparam [31:0] DONE_PC1 = 32'h00000A28;
localparam [31:0] DONE_PC2 = 32'h00000A28;
localparam [31:0] DONE_PC3 = 32'h00000A28;

//------------------------------------------------------------
// ??????????
//------------------------------------------------------------
reg clk_osc;
reg rst;
integer timeout_cycles;
integer i, j;
integer err_cnt;

// ???????????? (16-bit ????)
reg signed [15:0] test_data [0:63];
reg signed [15:0] expected_data [0:63];
reg signed [15:0] temp_val;

//------------------------------------------------------------
// 1. ?????????? (?? 0 ????)
//------------------------------------------------------------
initial begin
    $display("==================================================");
    $display("Generating Random Signed Dataset & Computing Golden Model...");
    
    // ?? 64 ??????? 16-bit ???????????
    for(i = 0; i < 64; i = i + 1) begin
        test_data[i] = $random; 
        expected_data[i] = test_data[i];
        
        // ????????
        // ???????????????????????
        // ?????? dut.u_test_ROM.mem ???????????????????????????
        dut.u_test_ROM.mem[i] = test_data[i]; 
    end

    // ????????? Golden Model ?????
    for(i = 0; i < 64; i = i + 1) begin
        for(j = 0; j < 63 - i; j = j + 1) begin
            // ???? $signed ????????? ARM ???? SUBS ??
            if ($signed(expected_data[j]) > $signed(expected_data[j+1])) begin
                temp_val = expected_data[j];
                expected_data[j] = expected_data[j+1];
                expected_data[j+1] = temp_val;
            end
        end
    end
    $display("Dataset Injection Complete. Ready for Hardware Sorting.");
    $display("==================================================");
end

//------------------------------------------------------------
// 2. ????: 100 MHz
//------------------------------------------------------------
initial begin
    clk_osc = 1'b0;
    forever #5 clk_osc = ~clk_osc;
end

//------------------------------------------------------------
// 3. ?????? (DUT)
//------------------------------------------------------------
top #(
    .DONE_PC_CORE0 (DONE_PC0),
    .DONE_PC_CORE1 (DONE_PC1),
    .DONE_PC_CORE2 (DONE_PC2),
    .DONE_PC_CORE3 (DONE_PC3)
) dut (
    .clk_osc (clk_osc),
    .rst     (rst)
);

//------------------------------------------------------------
// 4. ????????????
//------------------------------------------------------------
initial begin
    // ?????????????????
    rst = 1'b1;
    #100; 
    rst = 1'b0;

    timeout_cycles = 0;

    // ????????
    while (dut.done !== 1'b1 && timeout_cycles < 20000) begin
        @(posedge clk_osc);
        timeout_cycles = timeout_cycles + 1;
        
        if ((timeout_cycles % 200) == 0) begin
            $display(" [%0d cycles] Running... core_done = %b%b%b%b", 
                     timeout_cycles, 
                     dut.core_done3, dut.core_done2, 
                     dut.core_done1, dut.core_done0);
        end
    end

    $display("==================================================");
    if (dut.done === 1'b1) begin
        $display(" * SUCCESS * : Hardware sorting finished in %0d cycles.", dut.cnt_test);
        
        // --------------------------------------------------------
        // ???????
        // --------------------------------------------------------
        $display(" => Starting Automated Data Verification...");
        err_cnt = 0;
        
        for(i = 0; i < 64; i = i + 1) begin
            // ?????? verify_RAM ????????? expected_data
            if ($signed(dut.u_verify_RAM.mem[i]) !== $signed(expected_data[i])) begin
                $display(" [FAIL] Index %0d: Expected = %0d, Got = %0d", 
                         i, $signed(expected_data[i]), $signed(dut.u_verify_RAM.mem[i]));
                err_cnt = err_cnt + 1;
            end
        end
        
        $display("--------------------------------------------------");
        if (err_cnt == 0) begin
            $display(" [TEST PASSED] ! All 64 elements sorted correctly under random dataset.");
        end else begin
            $display(" [TEST FAILED] ! Found %0d mismatch errors.", err_cnt);
        end

    end else begin
        $display(" * FAILED * : Simulation Timeout after %0d cycles.", timeout_cycles);
        $display(" Current PC values:");
        $display("  Core0 PC: 0x%08h", dut.debug_pc0);
        $display("  Core1 PC: 0x%08h", dut.debug_pc1);
        $display("  Core2 PC: 0x%08h", dut.debug_pc2);
        $display("  Core3 PC: 0x%08h", dut.debug_pc3);
    end
    $display("==================================================");

    $finish;
end

endmodule
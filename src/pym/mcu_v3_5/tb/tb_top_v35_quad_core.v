//============================================================
// ???????
// 1. ??????????????? PC ??????????????
//    ????? clk_osc ? rst ???
// 2. ???????? 100MHz (??10ns) ????????
// 3. DUT ?????? top ??????????? DONE_PC?
// 4. ???????
//    - ???????
//    - ?? while ??????? dut.done ???
//    - ???????????Timeout???????????????
//    - ?????????????????? (cnt_test) ???
//============================================================

`timescale 1ns/1ps

module tb_top_v35_simple;

//------------------------------------------------------------
// ???? (??????????? PC ??????? Hex/????????)
//------------------------------------------------------------
//localparam [31:0] DONE_PC0 = 32'h00000AB0;
//localparam [31:0] DONE_PC1 = 32'h00000AB0;
//localparam [31:0] DONE_PC2 = 32'h00000AB0;
//localparam [31:0] DONE_PC3 = 32'h00000AB0;


localparam [31:0] DONE_PC0 = 32'h00000AC8;
localparam [31:0] DONE_PC1 = 32'h00000AC8;
localparam [31:0] DONE_PC2 = 32'h00000AC8;
localparam [31:0] DONE_PC3 = 32'h00000AC8;
//------------------------------------------------------------
// ????
//------------------------------------------------------------
reg clk_osc;
reg rst;
integer timeout_cycles;

//------------------------------------------------------------
// 1. ????: 100 MHz
//------------------------------------------------------------
initial begin
    clk_osc = 1'b0;
    forever #5 clk_osc = ~clk_osc;
end

//------------------------------------------------------------
// 2. ??????? (DUT)
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
// 3. ?????
//------------------------------------------------------------
initial begin
    $display("==================================================");
    $display("V3.5 Simple Testbench (Using built-in COE data)");
    $display("==================================================");

    // ????
    rst = 1'b1;
    #100; 
    rst = 1'b0;

    timeout_cycles = 0;

    // ????????? ST_DONE (? dut.done ?? 1)
    // ?? 200,000 ????????????????????
    while (dut.done !== 1'b1 && timeout_cycles < 200000) begin
        @(posedge clk_osc);
        timeout_cycles = timeout_cycles + 1;
        
        // ? 20,000 ???????????????????
        if ((timeout_cycles % 20000) == 0) begin
            $display(" [%0d cycles] Running... core_done = %b%b%b%b", 
                     timeout_cycles, 
                     dut.core_done3, dut.core_done2, 
                     dut.core_done1, dut.core_done0);
        end
    end

    // ????
    $display("==================================================");
    if (dut.done === 1'b1) begin
        $display(" * SUCCESS * : All cores finished and FSM reached ST_DONE.");
        $display(" Total sorting cycles (dut.cnt_test) = %0d", dut.cnt_test);
    end else begin
        $display(" * FAILED * : Simulation Timeout after %0d cycles.", timeout_cycles);
        $display(" Current PC values:");
        $display("  Core0 PC: 0x%08h", dut.debug_pc0);
        $display("  Core1 PC: 0x%08h", dut.debug_pc1);
        $display("  Core2 PC: 0x%08h", dut.debug_pc2);
        $display("  Core3 PC: 0x%08h", dut.debug_pc3);
    end
    $display("==================================================");

    // ???????????????????????? verify_RAM ????
    // ???$display("Result 0: %h", dut.u_verify_RAM.mem[0]);

    $finish;
end

endmodule
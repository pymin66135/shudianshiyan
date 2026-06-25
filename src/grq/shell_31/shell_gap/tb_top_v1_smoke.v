//============================================================
// Testbench: tb_top_v1_smoke
// Description:
//   Smoke test for V1 external top wrapper.
//
// What this test proves now:
//   1. top.v can read 64 values from external test_ROM model.
//   2. top.v can load them into mcu_top internal data_mem.
//   3. MCU can run the built-in current sort8 unsigned program.
//   4. top.v can write 64 values to verify_RAM model.
//   5. cnt_test starts at first ROM access and stops after final RAM write.
//
// Important:
//   The current built-in instr_rom program sorts only the first 8 unsigned
//   values and ends at PC=0x3C. Therefore this testbench overrides DONE_PC
//   to 0x3C and uses non-negative first-8 input values. After your real
//   64 signed program is ready, set PROGRAM_FROM_FILE=1 and DONE_PC=0xFF
//   or the actual final PC word.
//============================================================

`timescale 1ns/1ps

module tb_top_v1_smoke;

reg clk_osc;
reg rst;
integer i;
integer errors;
integer timeout_cycles;

// 100 MHz simulation clock
initial begin
    clk_osc = 1'b0;
    forever #5 clk_osc = ~clk_osc;
end

// Use current built-in sort8 program, whose DONE loop is at 0x3C.
top #(
    .PROGRAM_FROM_FILE    (0),
    .INSTR_ROM_ADDR_WIDTH (8),
    .DATA_MEM_ADDR_WIDTH  (8),
    .DONE_PC              (32'h00000168),
    .N_DATA               (64)
) dut (
    .clk_osc (clk_osc),
    .rst     (rst)
);

initial begin
    errors = 0;

    // Initialize external test_ROM model.
    // 64 deliberately unsorted signed 16-bit values.
    dut.u_test_ROM.mem[0]  = 16'sd42;
    dut.u_test_ROM.mem[1]  = -16'sd7;
    dut.u_test_ROM.mem[2]  = 16'sd19;
    dut.u_test_ROM.mem[3]  = -16'sd3;
    dut.u_test_ROM.mem[4]  = 16'sd88;
    dut.u_test_ROM.mem[5]  = 16'sd1;
    dut.u_test_ROM.mem[6]  = -16'sd55;
    dut.u_test_ROM.mem[7]  = 16'sd13;
    dut.u_test_ROM.mem[8]  = -16'sd20;
    dut.u_test_ROM.mem[9]  = 16'sd0;
    dut.u_test_ROM.mem[10] = 16'sd32767;
    dut.u_test_ROM.mem[11] = 16'h8000;      // -32768
    dut.u_test_ROM.mem[12] = 16'sd100;
    dut.u_test_ROM.mem[13] = -16'sd100;
    dut.u_test_ROM.mem[14] = 16'sd5;
    dut.u_test_ROM.mem[15] = -16'sd1;

    dut.u_test_ROM.mem[16] = 16'sd256;
    dut.u_test_ROM.mem[17] = -16'sd256;
    dut.u_test_ROM.mem[18] = 16'sd17;
    dut.u_test_ROM.mem[19] = 16'sd17;
    dut.u_test_ROM.mem[20] = -16'sd17;
    dut.u_test_ROM.mem[21] = 16'sd64;
    dut.u_test_ROM.mem[22] = -16'sd64;
    dut.u_test_ROM.mem[23] = 16'sd9;
    dut.u_test_ROM.mem[24] = -16'sd9;
    dut.u_test_ROM.mem[25] = 16'sd300;
    dut.u_test_ROM.mem[26] = -16'sd300;
    dut.u_test_ROM.mem[27] = 16'sd2;
    dut.u_test_ROM.mem[28] = -16'sd2;
    dut.u_test_ROM.mem[29] = 16'sd1234;
    dut.u_test_ROM.mem[30] = -16'sd1234;
    dut.u_test_ROM.mem[31] = 16'sd50;

    dut.u_test_ROM.mem[32] = -16'sd50;
    dut.u_test_ROM.mem[33] = 16'sd999;
    dut.u_test_ROM.mem[34] = -16'sd999;
    dut.u_test_ROM.mem[35] = 16'sd8;
    dut.u_test_ROM.mem[36] = -16'sd8;
    dut.u_test_ROM.mem[37] = 16'sd77;
    dut.u_test_ROM.mem[38] = -16'sd77;
    dut.u_test_ROM.mem[39] = 16'sd31;
    dut.u_test_ROM.mem[40] = -16'sd31;
    dut.u_test_ROM.mem[41] = 16'sd6;
    dut.u_test_ROM.mem[42] = -16'sd6;
    dut.u_test_ROM.mem[43] = 16'sd14;
    dut.u_test_ROM.mem[44] = -16'sd14;
    dut.u_test_ROM.mem[45] = 16'sd2000;
    dut.u_test_ROM.mem[46] = -16'sd2000;
    dut.u_test_ROM.mem[47] = 16'sd11;

    dut.u_test_ROM.mem[48] = -16'sd11;
    dut.u_test_ROM.mem[49] = 16'sd25;
    dut.u_test_ROM.mem[50] = -16'sd25;
    dut.u_test_ROM.mem[51] = 16'sd4;
    dut.u_test_ROM.mem[52] = -16'sd4;
    dut.u_test_ROM.mem[53] = 16'sd16;
    dut.u_test_ROM.mem[54] = -16'sd16;
    dut.u_test_ROM.mem[55] = 16'sd33;
    dut.u_test_ROM.mem[56] = -16'sd33;
    dut.u_test_ROM.mem[57] = 16'sd90;
    dut.u_test_ROM.mem[58] = -16'sd90;
    dut.u_test_ROM.mem[59] = 16'sd12;
    dut.u_test_ROM.mem[60] = -16'sd12;
    dut.u_test_ROM.mem[61] = 16'sd7;
    dut.u_test_ROM.mem[62] = -16'sd5;
    dut.u_test_ROM.mem[63] = 16'sd3;

    rst = 1'b1;
    repeat (5) @(posedge clk_osc);
    rst = 1'b0;

    timeout_cycles = 0;
    while (dut.done !== 1'b1 && timeout_cycles < 50000) begin
        @(posedge clk_osc);
        timeout_cycles = timeout_cycles + 1;
    end

    if (dut.done !== 1'b1) begin
        $display("FAIL: timeout waiting for top DONE state.");
        errors = errors + 1;
    end else begin
        $display("PASS: top reached DONE. cnt_test = %0d", dut.cnt_test);
    end

    // Give the last verify_RAM write a delta/cycle margin.
    repeat (2) @(posedge clk_osc);

    $display("========================================");
    $display("verify_RAM final data:");
    for (i = 0; i < 64; i = i + 1) begin
        $display("verify[%0d] = %0d (0x%04h)",
                 i, $signed(dut.u_verify_RAM.mem[i]), dut.u_verify_RAM.mem[i]);
    end
    $display("========================================");

    // Full output should be signed ascending.
    for (i = 0; i < 63; i = i + 1) begin
        if ($signed(dut.u_verify_RAM.mem[i]) > $signed(dut.u_verify_RAM.mem[i+1])) begin
            $display("FAIL: signed order violation at %0d: %0d > %0d",
                     i, $signed(dut.u_verify_RAM.mem[i]), $signed(dut.u_verify_RAM.mem[i+1]));
            errors = errors + 1;
        end
    end

    if (dut.cnt_test === 20'd0) begin
        $display("FAIL: cnt_test did not count.");
        errors = errors + 1;
    end

    if (errors == 0) begin
        $display("========================================");
        $display("SORT64 SIGNED BUBBLE TEST PASSED.");
        $display("========================================");
    end else begin
        $display("========================================");
        $display("SORT64 SIGNED BUBBLE TEST FAILED: errors = %0d", errors);
        $display("========================================");
    end

    $finish;
end

task check16;
    input integer idx;
    input [15:0] expected;
    begin
        if (dut.u_verify_RAM.mem[idx] !== expected) begin
            $display("FAIL: verify[%0d] expected 0x%04h, got 0x%04h",
                     idx, expected, dut.u_verify_RAM.mem[idx]);
            errors = errors + 1;
        end else begin
            $display("PASS: verify[%0d] = 0x%04h", idx, expected);
        end
    end
endtask

endmodule

//============================================================
// Behavioral simulation models for Vivado IPs.
// Add this file to Simulation Sources only. Do not add it to
// Design Sources when real IP wrappers are present.
//============================================================

module sys_clk (
    output wire clk_out1,
    input  wire clk_in1
);
assign clk_out1 = clk_in1;
endmodule

module test_ROM (
    input  wire       clka,
    input  wire       ena,
    input  wire [5:0] addra,
    output reg [15:0] douta
);
reg [15:0] mem [0:63];
reg [5:0] addr_d1;
reg [5:0] addr_d2;
integer k;

initial begin
    for (k = 0; k < 64; k = k + 1) begin
        mem[k] = 16'd0;
    end
    addr_d1 = 6'd0;
    addr_d2 = 6'd0;
    douta   = 16'd0;
end

always @(posedge clka) begin
    if (ena) begin
        addr_d1 <= addra;
        addr_d2 <= addr_d1;
        douta   <= mem[addr_d2]; // 2-cycle read-latency model
    end
end
endmodule

module verify_RAM (
    input  wire       clka,
    input  wire       ena,
    input  wire [0:0] wea,
    input  wire [5:0] addra,
    input  wire [15:0] dina,
    output reg [15:0] douta
);
reg [15:0] mem [0:63];
reg [5:0] addr_d1;
reg [5:0] addr_d2;
integer k;

initial begin
    for (k = 0; k < 64; k = k + 1) begin
        mem[k] = 16'hxxxx;
    end
    addr_d1 = 6'd0;
    addr_d2 = 6'd0;
    douta   = 16'd0;
end

always @(posedge clka) begin
    if (ena) begin
        if (wea[0]) begin
            mem[addra] <= dina;
        end
        addr_d1 <= addra;
        addr_d2 <= addr_d1;
        douta   <= mem[addr_d2];
    end
end
endmodule

module ila_0 (
    input  wire        clk,
    input  wire [15:0] probe0,
    input  wire [15:0] probe1,
    input  wire [19:0] probe2,
    input  wire [2:0]  probe3,
    input  wire [0:0]  probe4,
    input  wire        probe5,
    input  wire [7:0]  probe6
);
// Empty simulation stub.
endmodule

//============================================================
// Testbench: tb_top_v1_full64
// Description:
//   Full 64-data sorting testbench for V1 external top wrapper.
//
// Main Structure:
//   1. Clock Generation: Generates a 100MHz simulation clock.
//   2. DUT Instantiation: Instantiates the top module, configuring it to
//      load the external 64-sort program and setting the proper DONE_PC.
//   3. Data Initialization: Injects 64 unsorted (descending) values into the test_ROM.
//   4. Execution & Timeout: Releases reset and waits for the top level 'done' 
//      signal with an extended timeout margin (50000 cycles).
//   5. Result Verification: Iterates through the 64 outputs in verify_RAM to 
//      ensure strictly ascending order and checks the cycle counter.
//   6. Behavioral Models: Simplified Vivado IP models for simulation.
//============================================================

`timescale 1ns/1ps

module tb_top_v1_full64;

reg clk_osc;
reg rst;
integer i;
integer errors;
integer timeout_cycles;

// 1. Clock Generation (100 MHz)
initial begin
    clk_osc = 1'b0;
    forever #5 clk_osc = ~clk_osc;
end

// 2. DUT Instantiation
// Configure parameters to load the real 64-number sorting program
top #(
    .PROGRAM_FILE         ("sort64_signed.hex"), // Ensure this file exists in sim directory
    .PROGRAM_FROM_FILE    (1),                   // Enable loading from hex file
    .INSTR_ROM_ADDR_WIDTH (8),
    .DATA_MEM_ADDR_WIDTH  (8),
    .DONE_PC              (32'h0000003C),        // Set to the actual end PC of your 64-sort program
    .N_DATA               (64)
) dut (
    .clk_osc (clk_osc),
    .rst     (rst)
);

// 3. Execution and Verification Main Block
initial begin
    errors = 0;

    // Initialize external test_ROM model with 64 unsorted values.
    // Using a strictly descending sequence (worst-case scenario for many algorithms).
    for (i = 0; i < 64; i = i + 1) begin
        // For signed testing: ranges from +31 down to -32
        dut.u_test_ROM.mem[i] = $unsigned(31 - i); 
    end

    rst = 1'b1;
    repeat (5) @(posedge clk_osc);
    rst = 1'b0;

    // 4. Execution & Timeout Monitor
    timeout_cycles = 0;
    // Increased timeout to 50000 for 64-item sorting algorithms
    while (dut.done !== 1'b1 && timeout_cycles < 50000) begin
        @(posedge clk_osc);
        timeout_cycles = timeout_cycles + 1;
    end

    if (dut.done !== 1'b1) begin
        $display("FAIL: timeout waiting for top DONE state. Cycles exceeded 50000.");
        errors = errors + 1;
    end else begin
        $display("PASS: top reached DONE. cnt_test = %0d", dut.cnt_test);
    end

    // Give the last verify_RAM write a delta/cycle margin.
    repeat (2) @(posedge clk_osc);

    $display("========================================");
    $display("verify_RAM final data (First 10 and Last 10):");
    for (i = 0; i < 10; i = i + 1) begin
        $display("verify[%0d] = %0d (0x%04h)", i, $signed(dut.u_verify_RAM.mem[i]), dut.u_verify_RAM.mem[i]);
    end
    $display("...");
    for (i = 54; i < 64; i = i + 1) begin
        $display("verify[%0d] = %0d (0x%04h)", i, $signed(dut.u_verify_RAM.mem[i]), dut.u_verify_RAM.mem[i]);
    end
    $display("========================================");

    // 5. Result Verification
    // Full output should be purely ascending.
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
        $display("V1 TOP FULL 64-DATA TEST PASSED.");
        $display("========================================");
    end else begin
        $display("========================================");
        $display("V1 TOP FULL 64-DATA TEST FAILED: errors = %0d", errors);
        $display("========================================");
    end

    $finish;
end

endmodule

//============================================================
// Behavioral simulation models for Vivado IPs.
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
    input  wire [2:0]  probe3
);
// Empty simulation stub.
endmodule
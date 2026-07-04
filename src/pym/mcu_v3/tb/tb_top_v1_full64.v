//============================================================
// Testbench: tb_top_v1_full64
// Description:
//   Multi-case teacher-data testbench for shell_31 version.
//
// Program source:
//   Use built-in instr_rom.v from shell_31.zip
//   PROGRAM_FROM_FILE = 0
//   No external .hex program is used.
//
// Teacher data:
//   INPUT_FILE / OUTPUT_FILE plusargs, defaulting to local test_data.
//
// IMPORTANT for shell_31 instr_rom.v:
//   DONE_PC = 0x00000168
//   INSTR_ROM_ADDR_WIDTH = 8 is enough.
//============================================================

`timescale 1ns/1ps

module tb_top_v1_full64;

reg clk_osc;
reg rst;

integer i;
integer case_id;
integer case_errors;
integer total_errors;
integer timeout_cycles;
integer printed_errors;

integer cnt_sum;
integer cnt_min;
integer cnt_max;

//============================================================
// Teacher test data paths
// Use forward slash "/" in Verilog string paths under Vivado.
//============================================================
localparam DEFAULT_INPUT_FILE_PATH  = "../../../../../test_data/sort_input.mem";
localparam DEFAULT_OUTPUT_FILE_PATH = "../../../../../test_data/sort_output.mem";

//============================================================
// Parameters for shell_31 version
//============================================================
localparam N_CASES = 10;
localparam N_DATA  = 64;

// shell_31/instr_rom.v has DONE loop at rom[90], PC = 90*4 = 0x168.
localparam [31:0] DONE_PC_VALUE = 32'h000028B4;

reg [15:0] input_all  [0:N_CASES*N_DATA-1];
reg [15:0] output_all [0:N_CASES*N_DATA-1];
reg [8*512-1:0] input_file_path;
reg [8*512-1:0] output_file_path;

//============================================================
// Clock generation: 100 MHz simulation clock
//============================================================
initial begin
    clk_osc = 1'b0;
    forever #5 clk_osc = ~clk_osc;
end

//============================================================
// DUT instantiation
// PROGRAM_FROM_FILE = 0 means using built-in instr_rom.v.
//============================================================
top #(
    .PROGRAM_FROM_FILE    (0),
    .INSTR_ROM_ADDR_WIDTH (12),
    .DATA_MEM_ADDR_WIDTH  (8),
    .DONE_PC              (DONE_PC_VALUE),
    .N_DATA               (N_DATA)
) dut (
    .clk_osc (clk_osc),
    .rst     (rst)
);

//============================================================
// Main test flow
//============================================================
initial begin
    total_errors = 0;
    cnt_sum      = 0;
    cnt_min      = 32'h7fffffff;
    cnt_max      = 0;

    $display("========================================");
    $display("Teacher multi-case test for shell_31");
    input_file_path  = DEFAULT_INPUT_FILE_PATH;
    output_file_path = DEFAULT_OUTPUT_FILE_PATH;
    if (!$value$plusargs("INPUT_FILE=%s", input_file_path)) begin
        input_file_path = DEFAULT_INPUT_FILE_PATH;
    end
    if (!$value$plusargs("OUTPUT_FILE=%s", output_file_path)) begin
        output_file_path = DEFAULT_OUTPUT_FILE_PATH;
    end
    $display("INPUT_FILE_PATH   = %s", input_file_path);
    $display("OUTPUT_FILE_PATH  = %s", output_file_path);
    $display("Program source    = built-in instr_rom.v");
    $display("PROGRAM_FROM_FILE = 0");
    $display("DONE_PC_VALUE     = 0x%08h", DONE_PC_VALUE);
    $display("========================================");

    $readmemh(input_file_path,  input_all);
    $readmemh(output_file_path, output_all);

    // Quick file-load check.
    $display("input_all[0]     = 0x%04h", input_all[0]);
    $display("output_all[0]    = 0x%04h", output_all[0]);
    $display("input_all[639]   = 0x%04h", input_all[N_CASES*N_DATA-1]);
    $display("output_all[639]  = 0x%04h", output_all[N_CASES*N_DATA-1]);

    if (^input_all[0] === 1'bx || ^output_all[0] === 1'bx) begin
        $display("FAIL: teacher input/output files were not loaded correctly.");
        $display("Please check these paths:");
        $display("  %s", input_file_path);
        $display("  %s", output_file_path);
        $finish;
    end

    //========================================================
    // Run all teacher cases
    //========================================================
    for (case_id = 0; case_id < N_CASES; case_id = case_id + 1) begin
        case_errors    = 0;
        printed_errors = 0;

        $display("========================================");
        $display("START TEST CASE %0d", case_id);
        $display("========================================");

        //----------------------------------------------------
        // Load this case into behavioral test_ROM.
        //----------------------------------------------------
        for (i = 0; i < N_DATA; i = i + 1) begin
            dut.u_test_ROM.mem[i] = input_all[case_id*N_DATA + i];
        end

        //----------------------------------------------------
        // Clear verify_RAM before each case.
        //----------------------------------------------------
        for (i = 0; i < N_DATA; i = i + 1) begin
            dut.u_verify_RAM.mem[i] = 16'hxxxx;
        end

        //----------------------------------------------------
        // Reset DUT.
        //----------------------------------------------------
        rst = 1'b1;
        repeat (8) @(posedge clk_osc);
        rst = 1'b0;

        //----------------------------------------------------
        // Wait for DONE.
        //----------------------------------------------------
        timeout_cycles = 0;
        while (dut.done !== 1'b1 && timeout_cycles < 100000) begin
            @(posedge clk_osc);
            timeout_cycles = timeout_cycles + 1;
        end

        if (dut.done !== 1'b1) begin
            $display("FAIL CASE %0d: timeout waiting for DONE.", case_id);
            $display("timeout_cycles = %0d", timeout_cycles);
            case_errors = case_errors + 1;
        end else begin
            $display("PASS CASE %0d: top reached DONE. cnt_test = %0d",
                     case_id, dut.cnt_test);
        end

        // Give final verify_RAM write some margin.
        repeat (2) @(posedge clk_osc);

        //----------------------------------------------------
        // Check output against teacher golden output.
        //----------------------------------------------------
        for (i = 0; i < N_DATA; i = i + 1) begin
            if (dut.u_verify_RAM.mem[i] !== output_all[case_id*N_DATA + i]) begin
                case_errors = case_errors + 1;

                // Print only first 8 mismatches per case to avoid huge logs.
                if (printed_errors < 8) begin
                    $display("FAIL CASE %0d at index %0d: got %0d (0x%04h), expected %0d (0x%04h)",
                             case_id,
                             i,
                             $signed(dut.u_verify_RAM.mem[i]),
                             dut.u_verify_RAM.mem[i],
                             $signed(output_all[case_id*N_DATA + i]),
                             output_all[case_id*N_DATA + i]);
                    printed_errors = printed_errors + 1;
                end
            end
        end

        if (case_errors > 8) begin
            $display("CASE %0d: only first 8 mismatches were printed; total case_errors = %0d",
                     case_id, case_errors);
        end

        //----------------------------------------------------
        // cnt_test sanity check.
        //----------------------------------------------------
        if (dut.cnt_test === 20'd0) begin
            $display("FAIL CASE %0d: cnt_test did not count.", case_id);
            case_errors = case_errors + 1;
        end

        //----------------------------------------------------
        // Statistics.
        //----------------------------------------------------
        cnt_sum = cnt_sum + dut.cnt_test;

        if (dut.cnt_test < cnt_min) begin
            cnt_min = dut.cnt_test;
        end

        if (dut.cnt_test > cnt_max) begin
            cnt_max = dut.cnt_test;
        end

        if (case_errors == 0) begin
            $display("CASE %0d PASSED. cnt_test = %0d", case_id, dut.cnt_test);
        end else begin
            $display("CASE %0d FAILED. errors = %0d", case_id, case_errors);
        end

        total_errors = total_errors + case_errors;

        repeat (5) @(posedge clk_osc);
    end

    //========================================================
    // Final summary
    //========================================================
    $display("========================================");
    $display("ALL TEST CASES FINISHED");
    $display("total_errors = %0d", total_errors);
    $display("average cnt_test = %0d", cnt_sum / N_CASES);
    $display("min cnt_test = %0d", cnt_min);
    $display("max cnt_test = %0d", cnt_max);
    $display("========================================");

    if (total_errors == 0) begin
        $display("MULTI-CASE SORT TEST PASSED.");
    end else begin
        $display("MULTI-CASE SORT TEST FAILED.");
    end

    $finish;
end

endmodule

//============================================================
// Behavioral simulation models for Vivado IPs.
// Add this file to Simulation Sources only.
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
    input  wire        clka,
    input  wire        ena,
    input  wire [0:0]  wea,
    input  wire [5:0]  addra,
    input  wire [15:0] dina,
    output reg  [15:0] douta
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

//============================================================
// Module: mcu_top_tb
// Description:
//   Testbench for V0 ARM A32 subset single-cycle MCU.
//
// Test items:
//   1. ADD/SUB/AND/ORR/MOV register and immediate instructions.
//   2. LDR/STR memory access.
//   3. B/BL branch and link behavior.
//
// Expected results:
//   Checked by debug signals and hierarchical register/memory access.
//============================================================

`timescale 1ns/1ps

module mcu_top_tb;

reg clk;
reg rst_n;

wire [31:0] debug_pc;
wire [31:0] debug_instr;
wire [31:0] debug_alu_result;
wire [31:0] debug_mem_wdata;
wire [31:0] debug_mem_addr;
wire [31:0] debug_reg_wdata;
wire [3:0]  debug_reg_waddr;
wire        debug_reg_write;
wire        debug_mem_write;
wire [3:0]  debug_flags;
wire        debug_unsupported;

integer cycle;
integer errors;

mcu_top #(
    // Use built-in ROM program by default to avoid path problems in Vivado.
    // To load program/program.hex manually, set PROGRAM_FROM_FILE to 1 and
    // make sure program.hex is in the simulator working directory, or use an
    // absolute path for PROGRAM_FILE.
    .PROGRAM_FILE("program.hex"),
    .PROGRAM_FROM_FILE(0)
) dut (
    .clk               (clk),
    .rst_n             (rst_n),
    .debug_pc          (debug_pc),
    .debug_instr       (debug_instr),
    .debug_alu_result  (debug_alu_result),
    .debug_mem_wdata   (debug_mem_wdata),
    .debug_mem_addr    (debug_mem_addr),
    .debug_reg_wdata   (debug_reg_wdata),
    .debug_reg_waddr   (debug_reg_waddr),
    .debug_reg_write   (debug_reg_write),
    .debug_mem_write   (debug_mem_write),
    .debug_flags       (debug_flags),
    .debug_unsupported (debug_unsupported)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk; // 100 MHz simulation clock
end

task check32;
    input [255:0] name;
    input [31:0] actual;
    input [31:0] expected;
    begin
        if (actual !== expected) begin
            $display("[FAIL] %0s actual=0x%08h expected=0x%08h", name, actual, expected);
            errors = errors + 1;
        end else begin
            $display("[PASS] %0s = 0x%08h", name, actual);
        end
    end
endtask

always @(posedge clk) begin
    if (rst_n) begin
        cycle <= cycle + 1;
        $display("cycle=%0d pc=0x%08h instr=0x%08h rw=%b wa=R%0d wd=0x%08h mw=%b ma=0x%08h md=0x%08h unsupported=%b",
                 cycle, debug_pc, debug_instr,
                 debug_reg_write, debug_reg_waddr, debug_reg_wdata,
                 debug_mem_write, debug_mem_addr, debug_mem_wdata,
                 debug_unsupported);
    end
end

initial begin
    cycle = 0;
    errors = 0;
    rst_n = 1'b0;

    repeat (3) @(posedge clk);
    rst_n = 1'b1;

    // Run enough cycles to execute the built-in program and several NOPs.
    repeat (35) @(posedge clk);
    #1;

    $display("\n========== Register checks ==========");
    check32("R0",  dut.u_reg_file.regs[0],  32'd5);
    check32("R1",  dut.u_reg_file.regs[1],  32'd3);
    check32("R2",  dut.u_reg_file.regs[2],  32'd8);
    check32("R3",  dut.u_reg_file.regs[3],  32'd2);
    check32("R4",  dut.u_reg_file.regs[4],  32'd1);
    check32("R5",  dut.u_reg_file.regs[5],  32'd7);
    check32("R6",  dut.u_reg_file.regs[6],  32'd8);
    check32("R7",  dut.u_reg_file.regs[7],  32'd0);
    check32("R8",  dut.u_reg_file.regs[8],  32'd12);
    check32("R9",  dut.u_reg_file.regs[9],  32'd7);
    check32("R10", dut.u_reg_file.regs[10], 32'd0);
    check32("R11", dut.u_reg_file.regs[11], 32'd12);
    check32("R14", dut.u_reg_file.regs[14], 32'd76);

    $display("\n========== Data memory checks ==========");
    check32("mem[0]", dut.u_data_mem.mem[0], 32'd8);
    check32("mem[1]", dut.u_data_mem.mem[1], 32'd2);
    check32("mem[2]", dut.u_data_mem.mem[2], 32'd1);
    check32("mem[3]", dut.u_data_mem.mem[3], 32'd7);
    check32("mem[4]", dut.u_data_mem.mem[4], 32'd12);
    check32("mem[5]", dut.u_data_mem.mem[5], 32'd12);
    check32("mem[6]", dut.u_data_mem.mem[6], 32'd76);

    $display("\n========== Summary ==========");
    if (errors == 0) begin
        $display("ALL TESTS PASSED.");
    end else begin
        $display("TESTS FAILED: %0d error(s).", errors);
    end

    $finish;
end

endmodule // mcu_top_tb

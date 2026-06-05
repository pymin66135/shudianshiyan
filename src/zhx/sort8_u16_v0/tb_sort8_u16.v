//============================================================
// Module: tb_sort8_u16
// Description:
//   Testbench for sort8_u16_unsigned.hex on the provided V0 ARM A32 MCU.
//   It preloads 8 unsigned 16-bit values into data_mem.mem[0..7],
//   runs the sorting program, and checks ascending order.
//============================================================

`timescale 1ns/1ps

module tb_sort8_u16;

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
    // Put sort8_u16_unsigned.hex in xsim working directory, or replace this
    // with an absolute path, for example:
    // .PROGRAM_FILE("D:/mcu_v0_arm_a32_single_cycle/program/sort8_u16_unsigned.hex"),
    .PROGRAM_FILE("sort8_u16_unsigned.hex"),
    .PROGRAM_FROM_FILE(1)
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
    forever #5 clk = ~clk;
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
        if (debug_unsupported) begin
            $display("[FAIL] unsupported instruction at cycle=%0d pc=0x%08h instr=0x%08h", cycle, debug_pc, debug_instr);
            errors = errors + 1;
        end
    end
end

initial begin
    cycle = 0;
    errors = 0;
    rst_n = 1'b0;

    // Let data_mem initial block finish, then preload test data.
    #1;
    dut.u_data_mem.mem[0] = 32'h0000FFFF; // 65535
    dut.u_data_mem.mem[1] = 32'h00000001; // 1
    dut.u_data_mem.mem[2] = 32'h00008000; // 32768
    dut.u_data_mem.mem[3] = 32'h00000011; // 17
    dut.u_data_mem.mem[4] = 32'h0000FFFE; // 65534
    dut.u_data_mem.mem[5] = 32'h00000000; // 0
    dut.u_data_mem.mem[6] = 32'h00009C40; // 40000
    dut.u_data_mem.mem[7] = 32'h00003039; // 12345

    repeat (3) @(posedge clk);
    rst_n = 1'b1;

    // Program length: 97 instructions. Run enough cycles to enter done loop.
    repeat (120) @(posedge clk);
    #1;

    $display("\n========== Sorted memory checks ==========");
    check32("mem[0]", dut.u_data_mem.mem[0], 32'h00000000);
    check32("mem[1]", dut.u_data_mem.mem[1], 32'h00000001);
    check32("mem[2]", dut.u_data_mem.mem[2], 32'h00000011);
    check32("mem[3]", dut.u_data_mem.mem[3], 32'h00003039);
    check32("mem[4]", dut.u_data_mem.mem[4], 32'h00008000);
    check32("mem[5]", dut.u_data_mem.mem[5], 32'h00009C40);
    check32("mem[6]", dut.u_data_mem.mem[6], 32'h0000FFFE);
    check32("mem[7]", dut.u_data_mem.mem[7], 32'h0000FFFF);

    $display("\n========== Summary ==========");
    if (errors == 0) begin
        $display("SORT8_U16 TEST PASSED.");
    end else begin
        $display("SORT8_U16 TEST FAILED: %0d error(s).", errors);
    end

    $finish;
end

endmodule

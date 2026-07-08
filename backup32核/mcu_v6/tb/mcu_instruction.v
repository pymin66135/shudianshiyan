//============================================================
// Module: tb_mcu_top
// Description:
//   针对 mcu_top (V3.5) 的简单测试平台。
//   在内部直接注入机器码，验证基本运算与访存指令。
//
// 结构说明:
//   1. 信号声明与时钟/复位生成：产生 100MHz 时钟和初始复位。
//   2. 全局寄存器文件 (GPRF) 模拟：在 TB 中简单实现一个 64 深度
//      的 SRAM，用于配合 LDR/STR 指令测试。
//   3. 模块例化 (mcu_top)：将 DONE_PC 设为 32'h24 (第9条指令)。
//   4. 机器码注入与控制流：通过 uut.rom 层次化路径，在 t=1 时
//      直接硬编码指令阵列，绕过外部 HEX 文件。
//============================================================

`timescale 1ns/1ps

module tb_mcu_top();

    // ---- 1. 信号声明与时钟/复位 ----
    reg         clk;
    reg         rst;
    reg         pc_enable;

    // GPRF 接口
    wire [5:0]  gprf_raddr;
    reg  [15:0] gprf_rdata;
    wire [5:0]  gprf_waddr;
    wire [15:0] gprf_wdata;
    wire        gprf_we;

    // Debug 接口
    wire [31:0] debug_pc;
    wire [31:0] debug_instr;
    wire [31:0] debug_alu_result;
    wire [31:0] debug_mem_wdata;
    wire [5:0]  debug_mem_addr;
    wire [31:0] debug_reg_wdata;
    wire [3:0]  debug_reg_waddr;
    wire        debug_reg_write;
    wire        debug_mem_write;
    wire [3:0]  debug_flags;
    wire        debug_unsupported;
    wire        core_done;

    // 时钟生成
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz
    end

    // ---- 2. 全局寄存器文件 (GPRF) 模拟 ----
    reg [15:0] gprf_mem [0:63];
    
    // GPRF 读取
    always @(*) begin
        gprf_rdata = gprf_mem[gprf_raddr];
    end

    // GPRF 写入
    always @(posedge clk) begin
        if (gprf_we) begin
            gprf_mem[gprf_waddr] <= gprf_wdata;
        end
    end

    // 初始化 GPRF
    integer i;
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            gprf_mem[i] = 16'h0000;
        end
    end

    // ---- 3. 模块例化 ----
    mcu_top #(
        .CORE_ID(0),
        .INSTR_ROM_ADDR_WIDTH(10),
        .PROGRAM_FILE("dummy.hex"), // 即使没有这个文件，后面也会强行覆盖
        .DONE_PC(32'h00000024)      // 设置第 9 条指令 (9 * 4 = 36 = 0x24) 为结束 PC
    ) uut (
        .clk(clk),
        .rst(rst),
        .pc_enable(pc_enable),
        .gprf_raddr(gprf_raddr),
        .gprf_rdata(gprf_rdata),
        .gprf_waddr(gprf_waddr),
        .gprf_wdata(gprf_wdata),
        .gprf_we(gprf_we),
        .debug_pc(debug_pc),
        .debug_instr(debug_instr),
        .debug_alu_result(debug_alu_result),
        .debug_mem_wdata(debug_mem_wdata),
        .debug_mem_addr(debug_mem_addr),
        .debug_reg_wdata(debug_reg_wdata),
        .debug_reg_waddr(debug_reg_waddr),
        .debug_reg_write(debug_reg_write),
        .debug_mem_write(debug_mem_write),
        .debug_flags(debug_flags),
        .debug_unsupported(debug_unsupported),
        .core_done(core_done)
    );

    // ---- 4. 机器码注入与控制流 ----
    initial begin
        // 初始化控制信号
        rst = 1;
        pc_enable = 0;

        // 延迟一点时间，确保绕开原代码 initial 块里 $readmemh 的影响
        #1; 
        
        // --- 强制写入指令 ROM (硬编码) ---
        // 使用标准 ARMv4T 指令编码格式
        
        // 0x00: MOV R1, #10
        uut.rom[0] = 32'hE3A0100A; 
        
        // 0x04: MOV R2, #20
        uut.rom[1] = 32'hE3A02014; 
        
        // 0x08: ADD R3, R1, #5   (R3 = 10 + 5 = 15)
        uut.rom[2] = 32'hE2813005; 
        
        // 0x0C: SUB R4, R2, #2   (R4 = 20 - 2 = 18)
        uut.rom[3] = 32'hE2424002; 
        
        // 0x10: AND R5, R3, #3   (R5 = 15 & 3 = 3)
        uut.rom[4] = 32'hE2035003; 
        
        // 0x14: ORR R6, R4, #8   (R6 = 18 | 8 = 26)
        uut.rom[5] = 32'hE3846008; 
        
        // 0x18: STR R6, [R0, #4] (gprf_mem[2] = 26) -> ALU算出的地址会自动适配模块的寻址逻辑
        uut.rom[6] = 32'hE5806004; 
        
        // 0x1C: LDR R7, [R0, #4] (R7 = gprf_mem[2] = 26)
        uut.rom[7] = 32'hE5907004; 
        
        // 0x20: B + 5 (指令试图跳转，但你核心不支持，PC 依然会乖乖变成 0x24)
        uut.rom[8] = 32'hEA000005; 
        
        // 0x24: NOP (触发 DONE_PC)
        uut.rom[9] = 32'hE1A00000; 

        // 释放复位
        #20;
        rst = 0;
        
        // 启动流水线
        #10;
        pc_enable = 1;

        // 等待 core_done 信号拉高
        wait(core_done == 1'b1);
        
        // 留出时间观察最后的写回波形
        #50;
        
        $display("========================================");
        $display("Simulation Finished!");
        $display("GPRF Mem[2] content = %d (Expected: 26)", gprf_mem[2]);
        $display("========================================");
        $finish;
    end

    // 可选：在控制台打印调试信息跟踪流水线状态
    always @(posedge clk) begin
        if (uut.ex_wb_valid) begin
            $display("Time: %0t | PC: %h | Instr: %h | ALU_Res: %h | Reg_W: %b (R%0d=%h)", 
                     $time, debug_pc, debug_instr, debug_alu_result, 
                     debug_reg_write, debug_reg_waddr, debug_reg_wdata);
        end
    end

endmodule
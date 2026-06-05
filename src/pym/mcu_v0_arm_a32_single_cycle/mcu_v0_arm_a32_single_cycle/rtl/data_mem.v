
//============================================================
// Module: data_mem
// Description:
//   Simulation data memory.
//   Word-addressed internally; byte address externally.
//   Combinational read and synchronous write for single-cycle MCU.
//
// 主要结构:
//   1. 参数与端口定义: 读写端口、时钟、写使能。
//   2. 内存数组定义: 32位宽的寄存器数组。
//   3. 地址映射: 外部字节地址转内部字地址 (word_index = addr[ADDR_WIDTH+1:2])。
//   4. 初始化逻辑: 先将全量内存清零，然后在字地址0-7覆盖写入8个16位无符号数。
//   5. 读写逻辑: 组合逻辑读出，时钟上升沿同步写入。
//============================================================

`timescale 1ns/1ps

module data_mem #(
    parameter ADDR_WIDTH = 8
)(
    input  wire        clk,
    input  wire [31:0] addr,
    input  wire [31:0] write_data,
    input  wire        mem_write,
    output wire [31:0] read_data
);

localparam DEPTH = (1 << ADDR_WIDTH);

reg [31:0] mem [0:DEPTH-1];
integer i;
wire [ADDR_WIDTH-1:0] word_index;

// 将外部字节地址转换为内部的字索引 (右移2位)
assign word_index = addr[ADDR_WIDTH+1:2];
assign read_data  = mem[word_index];

initial begin
    // 1. 默认将整个内存数组清零
    for (i = 0; i < DEPTH; i = i + 1) begin
        mem[i] = 32'b0;
    end
    
    // 2. 在前8个字地址 (字索引0-7，对应字节地址 0x00 到 0x1C) 填入8个16bits无符号整数
    // 注：因为总线是32位的，填入16位数值时，高16位全部置0，自然也满足了你“高8位为0”的要求。
    // 以下数值为你随意生成的测试数据，你可以根据具体算法需要自行修改后4位十六进制数。
    mem[0] = 32'h0000_1234;
    mem[1] = 32'h0000_5678;
    mem[2] = 32'h0000_9ABC;
    mem[3] = 32'h0000_DEF0;
    mem[4] = 32'h0000_1357;
    mem[5] = 32'h0000_2468;
    mem[6] = 32'h0000_369C;
    mem[7] = 32'h0000_FFFF; 
end

always @(posedge clk) begin
    if (mem_write) begin
        mem[word_index] <= write_data;
    end
end

endmodule // data_mem
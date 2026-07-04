/*
 * 模块名称: cnt_test_module
 * 主要结构:
 * 1. 端口定义: 时钟、复位、启动信号、结束信号，以及20位计数值输出。
 * 2. 状态寄存: 使用一个寄存器 (is_running) 记录计数器是否处于运行状态。一旦启动，直到结束信号到来前保持高电平。
 * 3. 计数逻辑: 在 running 状态下，每个时钟周期对20位寄存器进行累加。
 */
module cnt_test (
    input  wire        clk,
    input  wire        rst_n,      // 低电平异步复位
    input  wire        start_flag, // 读入第一个数据时给一个脉冲高电平
    input  wire        stop_flag,  // 最后一个数据输出完成时给一个脉冲高电平
    output reg  [19:0] cnt_test    // 20位计数器输出
);

    reg is_running;

    // 运行状态控制逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            is_running <= 1'b0;
        end else if (start_flag) begin
            is_running <= 1'b1;    // 一旦开始，中间禁止停止
        end else if (stop_flag) begin
            is_running <= 1'b0;    // 输出完成，停止计数
        end
    end

    // 20位计数逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt_test <= 20'd0;
        end else if (is_running) begin
            cnt_test <= cnt_test + 1'b1;
        end
    end

endmodule
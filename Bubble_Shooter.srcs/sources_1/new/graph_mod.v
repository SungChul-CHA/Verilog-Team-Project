`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// graph_mod(.clk(), .rstn(), .x(), .y(), .uart_rx_data(), .key(), .key_pulse(), .rand_num(), .rgb());
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module graph_mod(
    input clk,
    input rstn,
    input [10:0] x,
    input [10:0] y,
    input [7:0] uart_rx_data,
    input [4:0] key,
    input [4:0] key_pulse,
    input [5:0] rand_num,
    output [2:0] rgb
    );
    
    localparam R = 17, BALL_X_INIT = 567, BALL_Y_INIT = 750;
    localparam GAME_X_L = 256, GAME_X_R = 878;
    localparam BALLS_COLS = 18, LINE_SIZE = 3, ROOT_OFFSET = 13;
    
    wire [10:0] a1[BALLS_COLS-1:0];
    reg [10:0] a2[BALLS_COLS-1:0];
    
    genvar n;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign a1[n] = GAME_X_L + R * 2 + n + R;
    end
    
    integer i;
    initial begin
        for (i = 0; i < BALLS_COLS; i = i + 1) begin
            a2[i] = GAME_X_L + R * 2 * n + R + R;
        end
    end
    
    
    
endmodule

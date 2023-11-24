`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/11/23 20:11:16
// Design Name: 
// Module Name: ball_move
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ball_move(
        input clk,
        input rstn,
        input new_ball,
        input x,
        input y,
        input key,
        output [10:0] current_ball_x,
        output [10:0] current_ball_y
    );
    
    localparam R = 17, BALL_X_INIT = 567, BALL_Y_INIT = 750;
    localparam GAME_X_L = 256, GAME_X_R = 878, LINE_SIZE = 3;
    localparam BALLS_COLS = 18, BALLS_ROWS = 10, ROOT_OFFSET = 12;
    
    reg [10:0] current_ball_x, current_ball_y;
    reg [10:0] next_ball_x, next_ball_y;
    
    wire frame_tick;
    assign frame_tick = (x == 1023 & y == 767) ? 1 : 0;
   
    reg hit_wall;
    always @ (posedge clk) begin
        if (~rstn) hit_wall <= 0;
        else if (new_ball) hit_wall <= 0;
        else if (current_ball_x - R <= GAME_X_L) hit_wall <= 0;
        else if (current_ball_x + R >= GAME_X_R) hit_wall <= 1;
    end
   
    reg hit_ball;
    always @ (posedge clk) begin
        if (~rstn | new_ball) hit_ball <= 0;
        else if (current_ball_y <= R * 2 + ROOT_OFFSET + 2 * R) hit_ball <= 1;
    end
   
   reg ball_shoot;
    always @ (posedge clk) begin
        if (~rstn | new_ball) ball_shoot <= 0;
        else if(key == 5'h14) ball_shoot <= 1;
    end
   
   
    always @* begin
        if (frame_tick & ~hit_ball & ball_shoot) begin
            if (~hit_wall) begin
                next_ball_x = current_ball_x + 22; //        Ӹ    ball_vx_reg  ŭ       
                next_ball_y = current_ball_y - 4; //        Ӹ    ball_vy_reg  ŭ       
            end
            else begin
                next_ball_x = current_ball_x - 22; //        Ӹ    ball_vx_reg  ŭ       
                next_ball_y = current_ball_y - 4; //        Ӹ    ball_vy_reg  ŭ       
            end
        end
        else begin
            next_ball_x = current_ball_x; //frame_tick    ƴҶ             . 
            next_ball_y = current_ball_y; //frame_tick    ƴҶ             . 
        end
    end

    always @(posedge clk) begin
        if (~rstn) begin
            current_ball_x <= 512; 
            current_ball_y <= 700;
        end
        else begin
            current_ball_x <= next_ball_x; 
            current_ball_y <= next_ball_y;
        end
    end
    
endmodule

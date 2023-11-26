`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ball_move #(.(R), .BALLS_COLS(), .BALLS_ROWS(), .ROOT_OFFSET(), .BALL_X_INIT(), .BALL_Y_INIT(), .WIDTH(), .LINE_SIZE(), .GAME_X_OFFSET(), .MENU_WIDTH(), .MENU_X(), .GAME_X(), .GAME_WIDTH()) inst (.clk(), .rstn(), .new_ball(), .x(), .y(), .key(), .current_ball_x(), .current_ball_y());
// maekr : CHA
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
    
    parameter R = 17, BALLS_COLS = 18, BALLS_ROWS = 10, ROOT_OFFSET = 13;
    
    parameter BALL_X_INIT = 567, BALL_Y_INIT = 750;
    
    parameter WIDTH = 20, LINE_SIZE = 3;
    parameter GAME_X_OFFSET = 8;
    parameter MENU_WIDTH = 170;
    parameter MENU_X = WIDTH + LINE_SIZE;
    parameter GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    parameter GAME_WIDTH = R * (2 * (BALLS_COLS - 1) + 2);
    
    reg [10:0] current_ball_x, current_ball_y;
    reg [10:0] next_ball_x, next_ball_y;
    
    wire frame_tick;
    assign frame_tick = (x == 1023 & y == 767) ? 1 : 0;
   
    reg moving_right;
    always @ (posedge clk) begin
        if (~rstn) moving_right <= 1;
        else if (current_ball_x - R <= GAME_X) moving_right <= 1;
        else if (current_ball_x + R >= GAME_X + GAME_WIDTH) moving_right <= 0;
    end
   
    reg hit_ball;
    always @ (posedge clk) begin
        if (~rstn | new_ball) hit_ball <= 0;
        else if (current_ball_y <= R * 2 + ROOT_OFFSET + 2 * R) hit_ball <= 1;
    end
   
   reg ball_shoot;
    always @ (posedge clk) begin
        if (~rstn) ball_shoot <= 0;
        else if(key == 5'h1A) ball_shoot <= 1;
        else if (hit_ball) ball_shoot<=0;
    end
   
    always @* begin
        if (frame_tick & ~hit_ball & ball_shoot) begin
            if (moving_right) begin
                next_ball_x = current_ball_x + 22;        
                next_ball_y = current_ball_y - 4;        
            end
            else begin
                next_ball_x = current_ball_x - 22;        
                next_ball_y = current_ball_y - 4;        
            end
        end
        else begin
            next_ball_x = current_ball_x;  
            next_ball_y = current_ball_y;  
        end
    end

    always @(posedge clk) begin
        if (~rstn) begin
            current_ball_x <= BALL_X_INIT; 
            current_ball_y <= BALL_Y_INIT;
        end
        else begin
            current_ball_x <= next_ball_x;
            current_ball_y <= next_ball_y;
        end
    end
    
endmodule

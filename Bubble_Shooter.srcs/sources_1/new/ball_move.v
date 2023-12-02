`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ball_move #(R, BALLS_COLS, BALLS_ROWS, ROOT_OFFSET, BALL_X_INIT, BALL_Y_INIT, WIDTH, LINE_SIZE, GAME_X_OFFSET, MENU_WIDTH, MENU_X, GAME_X, GAME_WIDTH) ball_move_inst (clk, rstn, new_ball, x, y, key, dout_sin, dout_cos, current_ball_x, current_ball_y, ball_angle);
// maker : KYS
//
// 12/01 CHA
// remove useless comments
//
//////////////////////////////////////////////////////////////////////////////////


module ball_move(
        input clk,
        input rstn,
        input new_ball,
        input x,
        input y,
        input key,
        input signed [7:0] dout_sin, dout_cos,
        output [10:0] current_ball_x,
        output [10:0] current_ball_y,
        output reg [6:0] ball_angle
    );
    
    parameter R = 17, BALLS_COLS = 17, BALLS_ROWS = 10, ROOT_OFFSET = 13;
    
    parameter BALL_X_INIT = 567, BALL_Y_INIT = 750;
    
    parameter WIDTH = 20, LINE_SIZE = 3;
    parameter GAME_X_OFFSET = 10;
    parameter MENU_WIDTH = 174;
    parameter MENU_X = WIDTH + LINE_SIZE;
    parameter GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    parameter GAME_WIDTH = 2 * R * BALLS_COLS + 2 * R;
    
    reg [10:0] current_ball_x, current_ball_y;
    reg [10:0] next_ball_x, next_ball_y;
    
    wire frame_tick;
    assign frame_tick = (x == 1023 & y == 767) ? 1 : 0;
   
    reg hit_wall;
    always @ (posedge clk) begin
        if (~rstn) hit_wall <= 0;
        else if (current_ball_x - R <= GAME_X) hit_wall <= 0;
        else if (current_ball_x + R >= GAME_X+GAME_WIDTH) hit_wall <= 1;
    end
    
    reg hit_ball;
    always @ (posedge clk) begin
        if (~rstn | new_ball) hit_ball <= 0;
        else if (current_ball_y <= R * 2 + ROOT_OFFSET + 2 * R) hit_ball <= 1;
    end
   
   reg ball_shoot;
    always @ (posedge clk) begin
        if (~rstn) ball_shoot <= 0;
        else if(key == 5'h12) ball_shoot <= 1;
        else if (hit_ball) ball_shoot<=0;
    end
    
    
    reg [6:0] ball_control;
   
   always @(posedge clk) begin
        if(~rstn) ball_control <= 40;
        else if (~(key==5'h12)) 
            begin
                if(key==5'h14 & ~ball_shoot) ball_control<= ball_control+1'b1;
                else if(key==5'h16 & ~ball_shoot) ball_control<= ball_control-1'b1;
            end
        else if (key==5'h12) ball_angle <= ball_control;
   end


    always @* begin
        if (frame_tick & ~hit_ball & ball_shoot) begin
            if (~hit_wall) begin
                next_ball_x = current_ball_x + dout_cos;        
                next_ball_y = current_ball_y + dout_sin;        
            end
        else begin
            next_ball_x = current_ball_x;  
            next_ball_y = current_ball_y;  
        end
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

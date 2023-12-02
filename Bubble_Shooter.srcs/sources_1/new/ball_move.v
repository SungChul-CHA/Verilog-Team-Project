`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// ball_move #(R, BALLS_COLS, BALLS_ROWS, ROOT_OFFSET, MONITOR_HEIGHT, WIDTH, HEIGHT, LINE_SIZE, GAME_X_OFFSET, MENU_WIDTH, MENU_X, GAME_X, GAME_WIDTH, BOTTOM, BALL_X_INIT, BALL_Y_INIT) ball_move_inst (clk, rstn, new_ball, x, y, key, ball_angle, current_ball_x, current_ball_y, sball_on);
// maker : KYS
//
// 12/01 CHA
// remove useless comments
//
// 12/02 CHA
///////////////////////////////////Changes////////////////////////////////////////
// bug fix : input bus size was fault
// BALL_X_INIT, BALL_Y_INIT changes
// need to instance again
//////////////////////////////////////////////////////////////////////////////////
//
////////////////////////////////////Request//////////////////////////////////////// 
// enable signal add
//
//////////////////////////////////////////////////////////////////////////////////


module ball_move(
        input clk,
        input rstn,
        input new_ball,
        input [10:0] x,
        input [10:0] y,
        input [4:0] key,
        input [6:0] ball_angle,
        output [10:0] current_ball_x,
        output [10:0] current_ball_y,
        output sball_on
    );
    
    parameter R = 17, BALLS_COLS = 17, BALLS_ROWS = 19, ROOT_OFFSET = 13;
    parameter MONITOR_HEIGHT = 768;
    parameter WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    parameter GAME_X_OFFSET = 10;
    parameter MENU_WIDTH = 174;
    parameter MENU_X = WIDTH + LINE_SIZE;
    parameter GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    parameter GAME_WIDTH = 2 * R * BALLS_COLS + R;
    
    parameter BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    
    parameter BALL_X_INIT = GAME_X + GAME_WIDTH / 2, BALL_Y_INIT = BOTTOM - R;
    
    
    sin_unsigned_8x81 sin_inst(clk, 1'b0, ball_angle, , dout_sin);
    cos_signed_8x81 cos_inst(clk, 1'b0, ball_angle, , dout_cos);
    
    wire signed [7:0] dout_sin, dout_cos;
    
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
        if (~rstn) hit_ball <= 0;
        else if (current_ball_y <= R * 2 + ROOT_OFFSET + 2 * R) hit_ball <= 1;
    end
   
    reg ball_shoot;
    always @ (posedge clk) begin
        if (~rstn) ball_shoot <= 0;
        else if(key == 5'h15) ball_shoot <= 1;
        else if (hit_ball) ball_shoot <= 0;
    end
    

    always @* begin
        if (frame_tick & ~hit_ball & ball_shoot) begin
            if (~hit_wall) begin
                next_ball_x = current_ball_x + dout_cos;        
                next_ball_y = current_ball_y - dout_sin;        
            end
            else begin
                next_ball_x = current_ball_x - dout_cos;  
                next_ball_y = current_ball_y - dout_sin;  
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
    
    
    assign sball_on = ((x - current_ball_x)**2 + (y - current_ball_y)**2 <= R**2) ? 1 : 0;
    
endmodule

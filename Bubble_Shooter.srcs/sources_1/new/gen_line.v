`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_line #(R, BALLS_COLS, MONITOR_HEIGHT, WIDTH, HEIGHT, LINE_SIZE, GAME_X_OFFSET, MENU_WIDTH, MENU_X, BOTTOM, GAME_X, GAME_WIDTH, BALL_X_INIT, BALL_Y_INIT) gen_line_inst (clk, x, y, ball_angle, line_bit, line_on);
// Maker : CHA
// IP -> bram -> name : line_gen200x8100
// Port A Options -> Write Width : 200, Write Depth : 8100
// Other Options -> Load Init File : Check, Add Coe File
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_line(
    input clk,
    input [10:0] x,
    input [10:0] y,
    input [6:0] ball_angle,
    output line_bit,
    output line_on
    );
    
    parameter R = 17, BALLS_COLS = 17;
    
    parameter MONITOR_HEIGHT = 768;
    parameter WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    parameter GAME_X_OFFSET = 10;
    parameter MENU_WIDTH = 174;
    
    parameter MENU_X = WIDTH + LINE_SIZE;
    
    parameter BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    
    parameter GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    parameter GAME_WIDTH = 2 * R * BALLS_COLS + R;
    
    parameter BALL_X_INIT = GAME_X + GAME_WIDTH / 2;
    parameter BALL_Y_INIT = BOTTOM - R;
    
    parameter LINE_Y_SIZE = 100, LINE_X_SIZE = 200;
    parameter LINE_X = BALL_X_INIT - 200, LINE_Y = BALL_Y_INIT - 100;
    
    reg [7:0] bit_addr;

    wire [199:0] dout_line200;
    wire [6:0] row_addr;
    wire [12:0] rom_addr;
    
    line_gen200x8100 line_gen200x8100_inst (clk, 1'b0, rom_addr, , dout_line200);
    
    assign rom_addr = row_addr + 100 * ball_angle;
    assign line_bit = dout_line200[~bit_addr];
    assign line_on = (y>=LINE_Y && y<LINE_Y+LINE_Y_SIZE && x>=LINE_X && x<LINE_X+LINE_X_SIZE)? 1 : 0; 
    assign row_addr = y - LINE_Y;
    always @ (*) begin
        if (x>=LINE_X && x<LINE_X+LINE_X_SIZE) bit_addr = (x-LINE_X);  
        else bit_addr = 0;   
    end
    
endmodule

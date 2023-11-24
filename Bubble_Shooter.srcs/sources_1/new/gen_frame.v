`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_frame #(.R(), .BALLS_COLS(), .MONITOR_WIDTH(), .MONITOR_HEIGHT(), .WIDTH(), .HEIGHT(), .LINE_SIZE(), .GAME_X_OFFSET(), .INNER_MENU_OFFSET(), .MENU_WIDTH(), .INNER_MENU_Y(), .SCORE_MENU_HEIGHT(), .TOP(), .BOTTOM(), .MENU_X(), .GAME_X(), .GAME_WIDTH(), .INNER_MENU_X(), .INNER_MENU_WIDTH(), .INNER_MENU_HEIGHT(), .SCORE_MENU_X(), .SCORE_MENU_WIDTH()) inst (clk, x, y, frame_on);
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_frame (
    input clk,
    input [10:0] x,
    input [10:0] y,
    output frame_on
    );
    
    parameter R = 17, BALLS_COLS = 18;
    
    parameter MONITOR_WIDTH = 1024, MONITOR_HEIGHT = 768;
    // offset
    parameter WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    parameter GAME_X_OFFSET = 8, INNER_MENU_OFFSET = 5;
    // adjust
    parameter MENU_WIDTH = 170;
    parameter INNER_MENU_Y = 200;
    parameter SCORE_MENU_HEIGHT = 200;
    
    
    parameter TOP = HEIGHT + LINE_SIZE;
    parameter BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    
    parameter MENU_X = WIDTH + LINE_SIZE;
    
    parameter GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    parameter GAME_WIDTH = R * (2 * (BALLS_COLS - 1) + 2);
    
    parameter INNER_MENU_X = MENU_X + INNER_MENU_OFFSET + LINE_SIZE;
    parameter INNER_MENU_WIDTH = MENU_WIDTH - 2*(INNER_MENU_OFFSET + LINE_SIZE);
    parameter INNER_MENU_HEIGHT = MONITOR_HEIGHT - INNER_MENU_Y - HEIGHT - INNER_MENU_OFFSET - 3*LINE_SIZE;
    
    parameter SCORE_MENU_X = MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH;
    parameter SCORE_MENU_WIDTH = MENU_WIDTH;
    
    
    wire game_frame_on, menu_frame_on, inner_menu_frame_on, score_frame_on;
    
    assign frame_on = {|{game_frame_on, menu_frame_on, inner_menu_frame_on, score_frame_on}};
    
    assign game_frame_on = ((((x >= GAME_X - LINE_SIZE && x < GAME_X) || (x >= GAME_X + GAME_WIDTH && x < GAME_X + GAME_WIDTH + LINE_SIZE)) && y >= TOP - LINE_SIZE && y < BOTTOM + LINE_SIZE) || 
                            (x >= GAME_X && x < GAME_X + GAME_WIDTH && ((y >= TOP - LINE_SIZE && y < TOP) || (y >= BOTTOM && y < BOTTOM + LINE_SIZE)))) ? 1 : 0;

    
    assign menu_frame_on = (((x >= MENU_X - LINE_SIZE && x < MENU_X) || (x >= MENU_X + MENU_WIDTH && x < MENU_X + MENU_WIDTH + LINE_SIZE)) && (y >= TOP - LINE_SIZE && y < BOTTOM + LINE_SIZE) ||
                            ((x >= MENU_X && x < MENU_X + MENU_WIDTH) && ((y >= TOP - LINE_SIZE && y < TOP) || (y >= BOTTOM && y < BOTTOM + LINE_SIZE)))) ? 1 : 0; 

    
    assign inner_menu_frame_on = ((((x >= INNER_MENU_X - LINE_SIZE) && (x < INNER_MENU_X)) || ((x >= INNER_MENU_X + INNER_MENU_WIDTH) && (x < INNER_MENU_X + INNER_MENU_WIDTH + LINE_SIZE))) && (y >= INNER_MENU_Y - LINE_SIZE && y < INNER_MENU_Y + INNER_MENU_HEIGHT + LINE_SIZE) ||
                                  ((x >= INNER_MENU_X) && (x < INNER_MENU_X + INNER_MENU_WIDTH) && ((y >= INNER_MENU_Y - LINE_SIZE && y < INNER_MENU_Y)|| (y >= INNER_MENU_Y + INNER_MENU_HEIGHT && y < INNER_MENU_Y + INNER_MENU_HEIGHT + LINE_SIZE)))) ? 1 : 0;

    
    assign score_frame_on = ((((x >= SCORE_MENU_X - LINE_SIZE && x < SCORE_MENU_X) || (x >= SCORE_MENU_X + SCORE_MENU_WIDTH && x < SCORE_MENU_X + SCORE_MENU_WIDTH + LINE_SIZE)) && (y >= TOP - LINE_SIZE && y < TOP + SCORE_MENU_HEIGHT + LINE_SIZE)) || 
                            ((x >= SCORE_MENU_X && x < SCORE_MENU_X + SCORE_MENU_WIDTH) && ((y >= TOP - LINE_SIZE && y < TOP) || (y >= TOP + SCORE_MENU_HEIGHT && y <TOP + SCORE_MENU_HEIGHT + LINE_SIZE)))) ? 1 : 0;
                       
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_frame #(.MONITOR_WIDTH(), .MONITOR_HEIGHT(), .WIDTH(), .HEIGHT(), .LINE_SIZE(), .R(), .BALLS_COLS(), .MENU_WIDTH(), .INNER_MENU_TOP(), .SCORE_HEIGHT(), .GAME_X_L_OFFSET(), .INNER_MENU_OFFSET(), .GAME_X_L(), .SCORE_MENU_X_L(), .GAME_TOP()) inst (clk, x, y, frame_on);
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_frame (
    input clk,
    input [10:0] x,
    input [10:0] y,
    output frame_on
    );
    
    parameter MONITOR_WIDTH = 1024, MONITOR_HEIGHT = 768;
    parameter WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    
    parameter R = 17, BALLS_COLS = 18;
    
    parameter MENU_WIDTH = 170;
    parameter INNER_MENU_TOP = 200;
    parameter SCORE_HEIGHT = 200;
    
    parameter GAME_X_L_OFFSET = 5;
    parameter INNER_MENU_OFFSET = 2;
    
    parameter GAME_X_L = MENU_WIDTH + WIDTH + 4 * LINE_SIZE + GAME_X_L_OFFSET, GAME_WIDTH = R * (2 * (BALLS_COLS - 1) + 2);
    parameter SCORE_MENU_X_L = MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH - LINE_SIZE;
    parameter GAME_TOP = HEIGHT + LINE_SIZE;
    
    wire game_frame_on, menu_frame_on, inner_menu_frame_on, score_frame_on;
    
    assign frame_on = {|{game_frame_on, menu_frame_on, inner_menu_frame_on, score_frame_on}};
    
    assign game_frame_on = ((((x >= GAME_X_L - LINE_SIZE && x < GAME_X_L) || (x >=  GAME_X_L + GAME_WIDTH && x < GAME_X_L + GAME_WIDTH + LINE_SIZE)) && y >= HEIGHT && y < MONITOR_HEIGHT - HEIGHT) || 
                            (x >= GAME_X_L && x < GAME_X_L + GAME_WIDTH && ((y >= HEIGHT && y < HEIGHT + LINE_SIZE) || (y >= MONITOR_HEIGHT - HEIGHT - LINE_SIZE && y < MONITOR_HEIGHT - HEIGHT)))) ? 1 : 0;

    
    assign menu_frame_on = (((x >= WIDTH && x < WIDTH + LINE_SIZE) || (x >= WIDTH + LINE_SIZE + MENU_WIDTH && x < WIDTH + LINE_SIZE + MENU_WIDTH + LINE_SIZE)) && (y >= HEIGHT && y < MONITOR_HEIGHT - HEIGHT) ||
                            ((x >= WIDTH && x < WIDTH + LINE_SIZE + MENU_WIDTH) && ((y >= HEIGHT && y < HEIGHT + LINE_SIZE) || (y >= MONITOR_HEIGHT - HEIGHT - LINE_SIZE && y < MONITOR_HEIGHT - HEIGHT)))) ? 1 : 0; 

    
    assign inner_menu_frame_on = ((((x >= WIDTH + LINE_SIZE + LINE_SIZE + INNER_MENU_OFFSET) && (x < WIDTH + 3 * LINE_SIZE + INNER_MENU_OFFSET)) || ((x >= GAME_X_L - 5 * LINE_SIZE - INNER_MENU_OFFSET - GAME_X_L_OFFSET) && (x < GAME_X_L - 4 * LINE_SIZE - INNER_MENU_OFFSET - GAME_X_L_OFFSET))) && (y >= INNER_MENU_TOP && y < MONITOR_HEIGHT - HEIGHT - 2 * LINE_SIZE - INNER_MENU_OFFSET) ||
                                  ((x >= WIDTH + LINE_SIZE + LINE_SIZE + INNER_MENU_OFFSET) && (x < GAME_X_L - 5 * LINE_SIZE - INNER_MENU_OFFSET - GAME_X_L_OFFSET) && ((y >= INNER_MENU_TOP && y < INNER_MENU_TOP + LINE_SIZE)|| (y >= MONITOR_HEIGHT - HEIGHT - LINE_SIZE * 3 - INNER_MENU_OFFSET && y < MONITOR_HEIGHT - HEIGHT - 2 * LINE_SIZE - INNER_MENU_OFFSET)))) ? 1 : 0;

    
    assign score_frame_on = ((((x >= SCORE_MENU_X_L && x < MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH) || (x >= MONITOR_WIDTH - WIDTH - LINE_SIZE && x < MONITOR_WIDTH - WIDTH)) && (y >= GAME_TOP && y < GAME_TOP + SCORE_HEIGHT)) || 
                            ((x >= SCORE_MENU_X_L && x < MONITOR_WIDTH - WIDTH) && ((y >= HEIGHT && y < HEIGHT + LINE_SIZE) || (y >= HEIGHT + LINE_SIZE + SCORE_HEIGHT && y < HEIGHT + LINE_SIZE + SCORE_HEIGHT + LINE_SIZE)))) ? 1 : 0;
                       
endmodule

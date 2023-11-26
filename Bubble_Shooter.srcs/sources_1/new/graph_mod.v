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
    
    // char size
    localparam WORD_Y_SIZE = 48, WORD_X_SIZE = 24, TIMES = 2, SPACE = 40;
    
    // ball
    localparam R = 17, BALLS_COLS = 18, BALLS_ROWS = 10, ROOT_OFFSET = 13;
    
    localparam BALL_X_INIT = 567, BALL_Y_INIT = 750;
    localparam V = 22;
    
    //display
    localparam MONITOR_WIDTH = 1024, MONITOR_HEIGHT = 768;
    // offset
    localparam WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    localparam GAME_X_OFFSET = 8, INNER_MENU_OFFSET = 5;
    // adjust
    localparam MENU_WIDTH = 170;
    localparam INNER_MENU_Y = 200;
    localparam SCORE_MENU_HEIGHT = 200;
    // frame
    localparam TOP = HEIGHT + LINE_SIZE;
    localparam BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    
    localparam MENU_X = WIDTH + LINE_SIZE;
    
    localparam GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    localparam GAME_WIDTH = R * (2 * (BALLS_COLS - 1) + 2);
    
    localparam INNER_MENU_X = MENU_X + INNER_MENU_OFFSET + LINE_SIZE;
    localparam INNER_MENU_WIDTH = MENU_WIDTH - 2*(INNER_MENU_OFFSET + LINE_SIZE);
    localparam INNER_MENU_HEIGHT = MONITOR_HEIGHT - INNER_MENU_Y - HEIGHT - INNER_MENU_OFFSET - 3*LINE_SIZE;
    
    localparam SCORE_MENU_X = MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH;
    localparam SCORE_MENU_WIDTH = MENU_WIDTH;
    
    
    wire [8:0] ball_x_odd[BALLS_COLS-1:0];
    wire [8:0] ball_x_even[BALLS_COLS-1:0];
    wire [8:0] ball_y[BALLS_ROWS-1:0];
    
    
    genvar n;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign ball_x_even[n] = GAME_X + (2*n+1)*R;
    end
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin    
        assign ball_x_odd[n] = GAME_X + 2*(n+1)*R;
    end
    
    for (n = 0; n < BALLS_ROWS; n = n + 1) begin
        assign ball_y[n] = (1 + n)*R + 12*n;
    end
    
    
    wire  [BALLS_COLS-1:0] cordinate_on;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign cordinate_on[0] = ({|{(x - ball_x_even[n])**2 + (y - ball_y[0])**2 <= R**2}}) ? 1 : 0;
    end
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign cordinate_on[1] = ({|{(x - ball_x_even[n])**2 + (y - ball_y[1])**2 <= R**2}}) ? 1 : 0;
    end
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign cordinate_on[2] = ({|{(x - ball_x_even[n])**2 + (y - ball_y[2])**2 <= R**2}}) ? 1 : 0;
    end
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign cordinate_on[3] = ({|{(x - ball_x_even[n])**2 + (y - ball_y[3])**2 <= R**2}}) ? 1 : 0;
    end
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign cordinate_on[4] = ({|{(x - ball_x_even[n])**2 + (y - ball_y[4])**2 <= R**2}}) ? 1 : 0;
    end
    
    

    ball_move ball_move_inst (clk, rstn, new_ball, x, y, key, current_ball_x, current_ball_y);
    
    
    wire sball_on;
    assign sball_on = ((x - current_ball_x)**2 + (y - current_ball_y)**2 <= R**2) ? 1 : 0;
    
    
    gen_frame gen_frame_inst (clk, x, y, frame_on);
    gen_chars gen_chars_inst (clk, x, y, , font_bit, char_on);
    
    
    assign rgb = (frame_on) ? 3'b111 :
                (font_bit & char_on) ? 3'b111 :
                ({|{cordinate_on}}) ? 3'b011 :
                (sball_on) ? 3'b101 : 3'b000;
    
endmodule

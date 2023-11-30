`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// graph_mod graph_inst(clk_vga, rstn, x, y, uart_rx_data, key, key_pulse, rand_num, rgb);
// Containing Codes are below
// 1. coordinate
// 2. FSM
// 3. other logics
// Maker : CHA
//
// 11/28 CHA
// Changes
// 
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
    
    // RGBCMY = rand_num
    
    // char size
    localparam WORD_Y_SIZE = 48, WORD_X_SIZE = 24, TIMES = 2, SPACE = 40;
    
    // ball
    localparam R = 17, BALLS_COLS = 17, BALLS_ROWS = 19, ROOT_OFFSET = 13;
    
    localparam BALL_X_INIT = 567, BALL_Y_INIT = 750;
    localparam V = 22;
    
    //display
    localparam MONITOR_WIDTH = 1024, MONITOR_HEIGHT = 768;
    // offset
    localparam WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    localparam GAME_X_OFFSET = 10, INNER_MENU_OFFSET = 5;
    // adjust
    localparam MENU_WIDTH = 174;
    localparam INNER_MENU_Y = 200;
    localparam SCORE_MENU_HEIGHT = 200;
    // frame
    localparam TOP = HEIGHT + LINE_SIZE;
    localparam BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    
    localparam MENU_X = WIDTH + LINE_SIZE;
    
    localparam GAME_X = MENU_X + MENU_WIDTH + LINE_SIZE + GAME_X_OFFSET + LINE_SIZE;
    localparam GAME_WIDTH = 2 * R * BALLS_COLS + R;
    
    localparam INNER_MENU_X = MENU_X + INNER_MENU_OFFSET + LINE_SIZE;
    localparam INNER_MENU_WIDTH = MENU_WIDTH - 2*(INNER_MENU_OFFSET + LINE_SIZE);
    localparam INNER_MENU_HEIGHT = MONITOR_HEIGHT - INNER_MENU_Y - HEIGHT - INNER_MENU_OFFSET - 3*LINE_SIZE;
    
    localparam SCORE_MENU_X = MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH;
    localparam SCORE_MENU_WIDTH = MENU_WIDTH;
    
    
    // coordinate
    reg [9:0] ball_x_odd[BALLS_COLS-1:0];
    reg [9:0] ball_x_even[BALLS_COLS-1:0];
    reg [9:0] ball_y[BALLS_ROWS-1:0];
    
    // init coordinate
    genvar n;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        always @ (posedge clk) begin
            if (~rstn) begin
                ball_x_even[n] = 0;
                ball_x_odd[n] = 0;
            end
            else begin
                ball_x_even[n] = GAME_X + (2*n + 1)*R;
                ball_x_odd[n] = GAME_X + 2*(n + 1)*R;
            end
        end
    end
    
    for (n = 0; n < BALLS_ROWS; n = n + 1) begin
        always @ (posedge clk) begin
            if (~rstn) ball_y[n] = 0;
            else ball_y[n] = (1 + n)*R + ROOT_OFFSET*n + TOP;
        end
    end
    
    
   
    
    
    ////////////////////////////////////////FSM
    parameter NEWGAME = 2'd0, PLAY = 2'd1, NEWBALL = 2'd2, GAMEOVER = 2'd3;
    
    reg score_clr, top_balls_clr;
    
    reg [1:0] c_state, n_state;
    
    always @ (posedge clk) begin
        if (~rstn) c_state <= 0;
        else c_state <= n_state;
    end
    
    always @ (*) begin
        case(c_state)
            NEWGAME: begin
                score_clr = 1;
                top_balls_clr = 1;
                if (key) begin
                    n_state = PLAY;
                end else n_state = NEWGAME;
                
            end
            PLAY: begin
                        end
            NEWBALL: begin
                
            
            end
            GAMEOVER: begin
            
            end
            default: n_state = NEWGAME;        
        endcase
    end
    
    
    
    reg [19:0] score;
    always @ (posedge clk) begin
        if (~rstn) score <= 0;
        else score <= 1;                    // score plus logic
    end
    
    
    ////////////////////////////////////////FSM
    
     reg [BALLS_COLS * BALLS_ROWS - 1:0] top_balls;
    always @ (posedge clk) begin
        if (~rstn) top_balls <= {68{1'b1}};
        else if (key_pulse) begin
            top_balls <= (top_balls << BALLS_COLS) + {BALLS_COLS{1'b1}};
        end
    end

    
    // ball_on_y[x]
    wire [BALLS_COLS-1:0] ball_on_0;
    wire [BALLS_COLS-1:0] ball_on_1;
    wire [BALLS_COLS-1:0] ball_on_2;
    wire [BALLS_COLS-1:0] ball_on_3;
    wire [BALLS_COLS-1:0] ball_on_4;
    wire [BALLS_COLS-1:0] ball_on_5;
    wire [BALLS_COLS-1:0] ball_on_6;
    wire [BALLS_COLS-1:0] ball_on_7;
    wire [BALLS_COLS-1:0] ball_on_8;
    wire [BALLS_COLS-1:0] ball_on_9;
    wire [BALLS_COLS-1:0] ball_on_10;
    wire [BALLS_COLS-1:0] ball_on_11;
    wire [BALLS_COLS-1:0] ball_on_12;
    wire [BALLS_COLS-1:0] ball_on_13;
    wire [BALLS_COLS-1:0] ball_on_14;
    wire [BALLS_COLS-1:0] ball_on_15;
    wire [BALLS_COLS-1:0] ball_on_16;
    wire [BALLS_COLS-1:0] ball_on_17;
    wire [BALLS_COLS-1:0] ball_on_18;

    // ball init
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign ball_on_0[n] = ((x-ball_x_even[n])**2 + (y-ball_y[0])**2 <= R**2) ? 1 : 0;
        assign ball_on_1[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[1])**2 <= R**2) ? 1 : 0;
        assign ball_on_2[n] = ((x-ball_x_even[n])**2 + (y-ball_y[2])**2 <= R**2) ? 1 : 0;
        assign ball_on_3[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[3])**2 <= R**2) ? 1 : 0;
        assign ball_on_4[n] = ((x-ball_x_even[n])**2 + (y-ball_y[4])**2 <= R**2) ? 1 : 0;
        assign ball_on_5[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[5])**2 <= R**2) ? 1 : 0;
        assign ball_on_6[n] = ((x-ball_x_even[n])**2 + (y-ball_y[6])**2 <= R**2) ? 1 : 0;
        assign ball_on_7[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[7])**2 <= R**2) ? 1 : 0;
        assign ball_on_8[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_9[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_10[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_11[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_12[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_13[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_14[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_15[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_16[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_17[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball_on_18[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;        
    end
    
    wire [BALLS_COLS-1:0] ball_on0, ball_on1, ball_on2, ball_on3, ball_on4, ball_on5, ball_on6, ball_on7, ball_on8, ball_on9, ball_on10, ball_on11, ball_on12, ball_on13, ball_on14, ball_on15, ball_on16, ball_on17, ball_on18;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign ball_on0[n] = (ball_on_0[n] & top_balls[n]) ? 1 : 0;
        assign ball_on1[n] = (ball_on_1[n] & top_balls[n + BALLS_COLS]) ? 1 : 0;
        assign ball_on2[n] = (ball_on_2[n] & top_balls[n + 2*BALLS_COLS]) ? 1 : 0;
        assign ball_on3[n] = (ball_on_3[n] & top_balls[n + 3*BALLS_COLS]) ? 1 : 0;
        assign ball_on4[n] = (ball_on_4[n] & top_balls[n + 4*BALLS_COLS]) ? 1 : 0;
        assign ball_on5[n] = (ball_on_5[n] & top_balls[n + 5*BALLS_COLS]) ? 1 : 0;
        assign ball_on6[n] = (ball_on_6[n] & top_balls[n + 6*BALLS_COLS]) ? 1 : 0;
        assign ball_on7[n] = (ball_on_7[n] & top_balls[n + 7*BALLS_COLS]) ? 1 : 0;
        assign ball_on8[n] = (ball_on_8[n] & top_balls[n + 8*BALLS_COLS]) ? 1 : 0;
        assign ball_on9[n] = (ball_on_9[n] & top_balls[n + 9*BALLS_COLS]) ? 1 : 0;
        assign ball_on10[n] = (ball_on_10[n] & top_balls[n + 10*BALLS_COLS]) ? 1 : 0;
        assign ball_on11[n] = (ball_on_11[n] & top_balls[n + 11*BALLS_COLS]) ? 1 : 0;
        assign ball_on12[n] = (ball_on_12[n] & top_balls[n + 12*BALLS_COLS]) ? 1 : 0;
        assign ball_on13[n] = (ball_on_13[n] & top_balls[n + 13*BALLS_COLS]) ? 1 : 0;
        assign ball_on14[n] = (ball_on_14[n] & top_balls[n + 14*BALLS_COLS]) ? 1 : 0;
        assign ball_on15[n] = (ball_on_15[n] & top_balls[n + 15*BALLS_COLS]) ? 1 : 0;
        assign ball_on16[n] = (ball_on_16[n] & top_balls[n + 16*BALLS_COLS]) ? 1 : 0;
        assign ball_on17[n] = (ball_on_17[n] & top_balls[n + 17*BALLS_COLS]) ? 1 : 0;
        assign ball_on18[n] = (ball_on_18[n] & top_balls[n + 18*BALLS_COLS]) ? 1 : 0;
    end
    
    wire [BALLS_COLS-1:0] ball_on;
    assign ball_on = ball_on0 | ball_on1 | ball_on2 | ball_on3 | ball_on4 | ball_on5 | ball_on6 | ball_on7 | ball_on8 | ball_on9 | ball_on10 | ball_on11 | ball_on12 | ball_on13 | ball_on14 | ball_on15 | ball_on16 | ball_on17 | ball_on18;
    

    wire sball_on;
    assign sball_on = ((x - current_ball_x)**2 + (y - current_ball_y)**2 <= R**2) ? 1 : 0;
    
    
    gen_frame #(R, BALLS_COLS, MONITOR_WIDTH, MONITOR_HEIGHT, WIDTH, HEIGHT, LINE_SIZE, GAME_X_OFFSET, INNER_MENU_OFFSET, MENU_WIDTH, INNER_MENU_Y, SCORE_MENU_HEIGHT, TOP, BOTTOM, MENU_X, GAME_X, GAME_WIDTH, INNER_MENU_X, INNER_MENU_WIDTH, INNER_MENU_HEIGHT, SCORE_MENU_X, SCORE_MENU_WIDTH) gen_frame_inst (clk, x, y, frame_on);
    gen_chars #(WORD_Y_SIZE, WORD_X_SIZE, TIMES, SPACE, MONITOR_WIDTH, MONITOR_HEIGHT, WIDTH, HEIGHT, LINE_SIZE, INNER_MENU_OFFSET, MENU_WIDTH, INNER_MENU_Y, TOP, BOTTOM, MENU_X, INNER_MENU_X, SCORE_MENU_X) gen_chars_inst (clk, x, y, digit, font_bit, char_on);
    ball_move #(R, BALLS_COLS, BALLS_ROWS, ROOT_OFFSET, BALL_X_INIT, BALL_Y_INIT, WIDTH, LINE_SIZE, GAME_X_OFFSET, MENU_WIDTH, MENU_X, GAME_X, GAME_WIDTH) ball_move_inst (clk, rstn, new_ball, x, y, key, dout_sin, dout_cos, current_ball_x, current_ball_y, ball_angle);
    
    
    assign rgb = (frame_on) ? 3'b111 :
                (font_bit & char_on) ? 3'b111 :
                ({|{ball_on}}) ? 3'b011 :
                (sball_on) ? 3'b101 : 3'b000;
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// graph_mod (clk_vga, rstn, x, y, uart_rx_data, key, key_pulse, rand_num, dout_sin, dout_cos, rgb, ball_angle);
// Containing Codes are below
// 1. coordinate
// 2. FSM
// 3. other logics
// Maker : CHA
//
// 11/28 CHA
// Changes
// 
// 12/01 CHA
///////////////////////////////////Changes////////////////////////////////////////
// change coordinate to F/F
// uncompleted FSM
// Change the logic of generating balls
/////////////////////////////////ToDo/////////////////////////////////////////////
// Seperate generate ball to individual module
// State Machine
// Logic of mathcing color
// Random Color
//////////////////////////////////////////////////////////////////////////////////
// 12/02 CHA
///////////////////////////////////Changes////////////////////////////////////////
// coordinate nonblocking
// ball signal statement
// FSM n_state done
// code refactored
/////////////////////////////////ToDo/////////////////////////////////////////////
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
    input signed [7:0] dout_sin, dout_cos,
    output [2:0] rgb,
    output [6:0] ball_angle
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
    
    // balls
    wire hit_balls;
    
    wire game_over, cal_done;
    
    
//////////////////////////////////////////////////////////////////////////////////coordinate
    // init coordinate
    genvar n;
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        always @ (posedge clk) begin
            if (~rstn) begin
                ball_x_even[n] <= 0;
                ball_x_odd[n] <= 0;
            end
            else begin
                ball_x_even[n] <= GAME_X + (2*n + 1)*R;
                ball_x_odd[n] <= GAME_X + 2*(n + 1)*R;
            end
        end
    end
    
    for (n = 0; n < BALLS_ROWS; n = n + 1) begin
        always @ (posedge clk) begin
            if (~rstn) ball_y[n] <= 0;
            else ball_y[n] <= (1 + n)*R + ROOT_OFFSET*n + TOP;
        end
    end
//////////////////////////////////////////////////////////////////////////////////coordinate
    
      
//////////////////////////////////////////////////////////////////////////////////top_balls_on
    reg [BALLS_COLS * BALLS_ROWS - 1:0] top_balls_num;
    always @ (posedge clk) begin
        if (~rstn) top_balls_num <= {68{1'b1}};
        else if (key_pulse) begin
            top_balls_num <= (top_balls_num << BALLS_COLS) + {BALLS_COLS{1'b1}};
        end
    end

    // bally[x]
    reg [BALLS_COLS-1:0] ball0;
    wire [BALLS_COLS-1:0] ball1;
    wire [BALLS_COLS-1:0] ball2;
    wire [BALLS_COLS-1:0] ball3;
    wire [BALLS_COLS-1:0] ball4;
    wire [BALLS_COLS-1:0] ball5;
    wire [BALLS_COLS-1:0] ball6;
    wire [BALLS_COLS-1:0] ball7;
    wire [BALLS_COLS-1:0] ball8;
    wire [BALLS_COLS-1:0] ball9;
    wire [BALLS_COLS-1:0] ball10;
    wire [BALLS_COLS-1:0] ball11;
    wire [BALLS_COLS-1:0] ball12;
    wire [BALLS_COLS-1:0] ball13;
    wire [BALLS_COLS-1:0] ball14;
    wire [BALLS_COLS-1:0] ball15;
    wire [BALLS_COLS-1:0] ball16;
    wire [BALLS_COLS-1:0] ball17;
    wire [BALLS_COLS-1:0] ball18;

    // ball init
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        always @ (posedge clk) begin
            if (~rstn) ball0[n] <= 0;
            else if ((x-ball_x_even[n])**2 + (y-ball_y[0])**2 <= R**2) ball0[n] <= 1;
            else ball0[n] <= 0;
        end
        assign ball1[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[1])**2 <= R**2) ? 1 : 0;
        assign ball2[n] = ((x-ball_x_even[n])**2 + (y-ball_y[2])**2 <= R**2) ? 1 : 0;
        assign ball3[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[3])**2 <= R**2) ? 1 : 0;
        assign ball4[n] = ((x-ball_x_even[n])**2 + (y-ball_y[4])**2 <= R**2) ? 1 : 0;
        assign ball5[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[5])**2 <= R**2) ? 1 : 0;
        assign ball6[n] = ((x-ball_x_even[n])**2 + (y-ball_y[6])**2 <= R**2) ? 1 : 0;
        assign ball7[n] = ((x-ball_x_odd[n])**2 + (y-ball_y[7])**2 <= R**2) ? 1 : 0;
        assign ball8[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball9[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball10[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball11[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball12[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball13[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball14[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball15[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball16[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball17[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;
        assign ball18[n] = ((x-ball_x_even[n])**2 + (y-ball_y[8])**2 <= R**2) ? 1 : 0;        
    end
    
    // ball_on y[x]
    wire [BALLS_COLS-1:0] ball_on0, ball_on1, ball_on2, ball_on3, ball_on4, ball_on5, ball_on6, ball_on7, ball_on8, ball_on9, 
    ball_on10, ball_on11, ball_on12, ball_on13, ball_on14, ball_on15, ball_on16, ball_on17, ball_on18;
    
    for (n = 0; n < BALLS_COLS; n = n + 1) begin
        assign ball_on0[n] = (ball0[n] & top_balls_num[n]) ? 1 : 0;
        assign ball_on1[n] = (ball1[n] & top_balls_num[n + BALLS_COLS]) ? 1 : 0;
        assign ball_on2[n] = (ball2[n] & top_balls_num[n + 2*BALLS_COLS]) ? 1 : 0;
        assign ball_on3[n] = (ball3[n] & top_balls_num[n + 3*BALLS_COLS]) ? 1 : 0;
        assign ball_on4[n] = (ball4[n] & top_balls_num[n + 4*BALLS_COLS]) ? 1 : 0;
        assign ball_on5[n] = (ball5[n] & top_balls_num[n + 5*BALLS_COLS]) ? 1 : 0;
        assign ball_on6[n] = (ball6[n] & top_balls_num[n + 6*BALLS_COLS]) ? 1 : 0;
        assign ball_on7[n] = (ball7[n] & top_balls_num[n + 7*BALLS_COLS]) ? 1 : 0;
        assign ball_on8[n] = (ball8[n] & top_balls_num[n + 8*BALLS_COLS]) ? 1 : 0;
        assign ball_on9[n] = (ball9[n] & top_balls_num[n + 9*BALLS_COLS]) ? 1 : 0;
        assign ball_on10[n] = (ball10[n] & top_balls_num[n + 10*BALLS_COLS]) ? 1 : 0;
        assign ball_on11[n] = (ball11[n] & top_balls_num[n + 11*BALLS_COLS]) ? 1 : 0;
        assign ball_on12[n] = (ball12[n] & top_balls_num[n + 12*BALLS_COLS]) ? 1 : 0;
        assign ball_on13[n] = (ball13[n] & top_balls_num[n + 13*BALLS_COLS]) ? 1 : 0;
        assign ball_on14[n] = (ball14[n] & top_balls_num[n + 14*BALLS_COLS]) ? 1 : 0;
        assign ball_on15[n] = (ball15[n] & top_balls_num[n + 15*BALLS_COLS]) ? 1 : 0;
        assign ball_on16[n] = (ball16[n] & top_balls_num[n + 16*BALLS_COLS]) ? 1 : 0;
        assign ball_on17[n] = (ball17[n] & top_balls_num[n + 17*BALLS_COLS]) ? 1 : 0;
        assign ball_on18[n] = (ball18[n] & top_balls_num[n + 18*BALLS_COLS]) ? 1 : 0;
    end
    
    wire [BALLS_COLS-1:0] ball_on;
    assign ball_on = ball_on0 | ball_on1 | ball_on2 | ball_on3 | ball_on4 | ball_on5 | ball_on6 | ball_on7 | ball_on8 | ball_on9 |
     ball_on10 | ball_on11 | ball_on12 | ball_on13 | ball_on14 | ball_on15 | ball_on16 | ball_on17 | ball_on18;
//////////////////////////////////////////////////////////////////////////////////top_balls_on
    

//////////////////////////////////////////////////////////////////////////////////FSM
    localparam NEWGAME = 3'd0, NEWBALL = 3'd1, PLAY = 3'd2,  CAL = 3'd3, GAMEOVER = 3'd4;
    
    reg [2:0] c_state, n_state;
    always @ (posedge clk) begin
        if (~rstn) c_state <= 0;
        else c_state <= n_state;
    end
    
    always @ (*) begin
        case(c_state)
            NEWGAME: begin
                if (key) n_state = PLAY;
                else n_state = NEWGAME;       
            end
            NEWBALL: begin
                if(key[4]) n_state = PLAY;
                else n_state = NEWBALL;
            end
            PLAY: begin
                if(hit_balls) n_state = CAL;
                else n_state = PLAY;
            end
            CAL: begin
                if(game_over) n_state = GAMEOVER;
                else if (cal_done) n_state = NEWBALL;
                else n_state = CAL;
            end
            GAMEOVER: begin
                if(key) n_state = NEWGAME;
                else n_state = GAMEOVER;
            end
            default: n_state = NEWGAME;        
        endcase
    end
//////////////////////////////////////////////////////////////////////////////////FSM
    
    
    reg [19:0] score;
    always @ (posedge clk) begin
        if (~rstn) score <= 0;
        else score <= 1;                    // score plus logic
    end
    
    
    
    

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

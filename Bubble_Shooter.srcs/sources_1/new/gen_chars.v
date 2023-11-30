`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_chars #(WORD_Y_SIZE, WORD_X_SIZE, TIMES, SPACE, MONITOR_WIDTH, MONITOR_HEIGHT, WIDTH, HEIGHT, LINE_SIZE, INNER_MENU_OFFSET, MENU_WIDTH, INNER_MENU_Y, TOP, BOTTOM, MENU_X, INNER_MENU_X, SCORE_MENU_X) gen_chars_inst (clk, x, y, digit, font_bit, char_on);
// Maker : CHA
// (11.30) menu 수정 & score 추가 by min
//////////////////////////////////////////////////////////////////////////////////


module gen_chars(
    input clk,
    input [10:0] x,
    input [10:0] y,
    input [0:0] digit,
    output font_bit,
    output char_on
    );
    
    parameter WORD_Y_SIZE = 48, WORD_X_SIZE = 24, TIMES = 2, SPACE = 40;
    
    parameter MONITOR_WIDTH = 1024, MONITOR_HEIGHT = 768;
    
    // offset
    parameter WIDTH = 20, HEIGHT = 45, LINE_SIZE = 3;
    parameter INNER_MENU_OFFSET = 5;
    // adjust
    parameter MENU_WIDTH = 174;
    parameter INNER_MENU_Y = 200;
    
    parameter TOP = HEIGHT + LINE_SIZE;
    parameter BOTTOM = MONITOR_HEIGHT - HEIGHT - LINE_SIZE;
    parameter MENU_X = WIDTH + LINE_SIZE;
    parameter INNER_MENU_X = MENU_X + INNER_MENU_OFFSET + LINE_SIZE;
    parameter SCORE_MENU_X = MONITOR_WIDTH - WIDTH - LINE_SIZE - MENU_WIDTH;
    
    
//
    wire [6:0] char_addr;
     reg [6:0] char_addr_m, char_addr_p, char_addr_p1,char_addr_e, char_addr_o, char_addr_h, char_addr_s, char_addr_n;
    wire [2:0] bit_addr;
    reg [2:0] bit_addr_m, bit_addr_p, bit_addr_p1,bit_addr_e, bit_addr_o, bit_addr_h, bit_addr_s, bit_addr_n;
    wire [3:0] row_addr;
    wire [3:0] row_addr_m, row_addr_p, row_addr_p1, row_addr_e, row_addr_o, row_addr_h, row_addr_s, row_addr_n; 
    wire menu_on, pause_on, help_on, score_on;
    
    wire [7:0] font_word;
    wire [10:0] rom_addr;
   
    assign char_on = {|{menu_on, play_on, exit_on, option_on, pause_on, help_on, score_on, num_on}};

    
    font_rom_vhd font_rom_inst (clk, rom_addr, font_word);

    assign rom_addr = {char_addr, row_addr};
    assign font_bit = font_word[~bit_addr]; //화면 x좌표는 왼쪽이 작은데, rom의 bit는 오른쪽이 작으므로 reverse

    assign char_addr = (menu_on)? char_addr_m : (pause_on)? char_addr_p : (play_on)? char_addr_p1 : (exit_on)? char_addr_e : (option_on)? char_addr_o : (help_on)? char_addr_h : (score_on)? char_addr_s : (num_on)? char_addr_n : 0;
    assign row_addr = (menu_on)? row_addr_m : (pause_on)? row_addr_p : (play_on)? row_addr_p1 : (exit_on)? row_addr_e : (option_on)? row_addr_o : (help_on)? row_addr_h : (score_on)? row_addr_s : (num_on)? row_addr_n : 0; 
    assign bit_addr = (menu_on)? bit_addr_m : (pause_on)? bit_addr_p : (play_on)? bit_addr_p1 : (exit_on)? bit_addr_e : (option_on)? bit_addr_o : (help_on)? bit_addr_h : (score_on)? bit_addr_s : (num_on)? bit_addr_n :0; 

    
    // MENU
    wire [9:0] menu_x_l, menu_y_t;
    assign menu_x_l = MENU_X + 30; 
    assign menu_y_t = TOP + 20; 
    assign menu_on = (y>=menu_y_t && y<menu_y_t+WORD_Y_SIZE && x>=menu_x_l && x<menu_x_l+WORD_X_SIZE*4 + 3)? 1 : 0; 
    assign row_addr_m = y-menu_y_t >> TIMES;
    always @ (*) begin
        if (x>=menu_x_l+WORD_X_SIZE*0 && x<menu_x_l+WORD_X_SIZE*1) begin bit_addr_m = (x-menu_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_m = 7'h4d; end // M    
        else if (x>=menu_x_l+WORD_X_SIZE*1 + 1 && x<menu_x_l+WORD_X_SIZE*2 + 1) begin bit_addr_m = (x-menu_x_l-WORD_X_SIZE*1 - 1) >> TIMES; char_addr_m = 7'h45; end // E
        else if (x>=menu_x_l+WORD_X_SIZE*2 + 2 && x<menu_x_l+WORD_X_SIZE*3 + 2) begin bit_addr_m = (x-menu_x_l-WORD_X_SIZE*2 - 2) >> TIMES; char_addr_m = 7'h4e; end // N 
        else if (x>=menu_x_l+WORD_X_SIZE*3 + 3 && x<menu_x_l+WORD_X_SIZE*4 + 3) begin bit_addr_m = (x-menu_x_l-WORD_X_SIZE*3 - 3) >> TIMES; char_addr_m = 7'h55; end // U
        else begin bit_addr_m = 0; char_addr_m = 0; end                         
    end
    
    
    // PAUSE
    wire [9:0] pause_x_l, pause_y_t;
    assign pause_x_l = INNER_MENU_X + 20; 
    assign pause_y_t = INNER_MENU_Y + 25; 
    assign pause_on = (y>=pause_y_t && y<pause_y_t+WORD_Y_SIZE && x>=pause_x_l && x<pause_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_p = y-pause_y_t >> TIMES;
    always @ (*) begin
        if (x>=pause_x_l+WORD_X_SIZE*0 && x<pause_x_l+WORD_X_SIZE*1) begin bit_addr_p = (x-pause_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_p = 7'h50; end // P    
        else if (x>=pause_x_l+WORD_X_SIZE*1 && x<pause_x_l+WORD_X_SIZE*2) begin bit_addr_p = (x-pause_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_p = 7'h41; end // A
        else if (x>=pause_x_l+WORD_X_SIZE*2 && x<pause_x_l+WORD_X_SIZE*3) begin bit_addr_p = (x-pause_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_p = 7'h55; end // U
        else if (x>=pause_x_l+WORD_X_SIZE*3 && x<pause_x_l+WORD_X_SIZE*4) begin bit_addr_p = (x-pause_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_p = 7'h53; end // S
        else if (x>=pause_x_l+WORD_X_SIZE*4 && x<pause_x_l+WORD_X_SIZE*5) begin bit_addr_p = (x-pause_x_l-WORD_X_SIZE*4) >> TIMES; char_addr_p = 7'h45; end // E
        else begin bit_addr_p = 0; char_addr_p = 0; end                         
    end
    
    // PLAY
    wire [9:0] play_x_l, play_y_t;
    assign play_x_l = INNER_MENU_X + 20; 
    assign play_y_t = INNER_MENU_Y + 125; 
    assign play_on = (y>=play_y_t && y<play_y_t+WORD_Y_SIZE && x>=play_x_l && x<play_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_p1 = y-play_y_t >> TIMES;
    always @ (*) begin
        if (x>=play_x_l+WORD_X_SIZE*0 && x<play_x_l+WORD_X_SIZE*1) begin bit_addr_p1 = (x-play_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_p1 = 7'h50; end // P    
        else if (x>=play_x_l+WORD_X_SIZE*1 && x<play_x_l+WORD_X_SIZE*2) begin bit_addr_p1 = (x-play_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_p1 = 7'h4c; end // L
        else if (x>=play_x_l+WORD_X_SIZE*2 && x<play_x_l+WORD_X_SIZE*3) begin bit_addr_p1 = (x-play_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_p1 = 7'h41; end // A 
        else if (x>=play_x_l+WORD_X_SIZE*3 && x<play_x_l+WORD_X_SIZE*4) begin bit_addr_p1 = (x-play_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_p1 = 7'h59; end // Y
        else begin bit_addr_p1 = 0; char_addr_p1 = 0; end                         
    end
    
    // EXIT
    wire [9:0] exit_x_l, exit_y_t;
    assign exit_x_l = INNER_MENU_X + 20; 
    assign exit_y_t = INNER_MENU_Y + 225; 
    assign exit_on = (y>=exit_y_t && y<exit_y_t+WORD_Y_SIZE && x>=exit_x_l && x<exit_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_e = y-exit_y_t >> TIMES;
    always @ (*) begin
        if (x>=exit_x_l+WORD_X_SIZE*0 && x<exit_x_l+WORD_X_SIZE*1) begin bit_addr_e = (x-exit_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_e = 7'h45; end // E    
        else if (x>=exit_x_l+WORD_X_SIZE*1 && x<exit_x_l+WORD_X_SIZE*2) begin bit_addr_e = (x-exit_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_e = 7'h58; end // X
        else if (x>=exit_x_l+WORD_X_SIZE*2 && x<exit_x_l+WORD_X_SIZE*3) begin bit_addr_e = (x-exit_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_e = 7'h49; end // I
        else if (x>=exit_x_l+WORD_X_SIZE*3 && x<exit_x_l+WORD_X_SIZE*4) begin bit_addr_e = (x-exit_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_e = 7'h54; end // T
        else begin bit_addr_e = 0; char_addr_e = 0; end                         
    end
    
    // OPTION
    wire [9:0] option_x_l, option_y_t;
    assign option_x_l = INNER_MENU_X + 20; 
    assign option_y_t = INNER_MENU_Y + 325; 
    assign option_on = (y>=option_y_t && y<option_y_t+WORD_Y_SIZE && x>=option_x_l && x<option_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_o = y-option_y_t >> TIMES;
    always @ (*) begin
        if (x>=option_x_l+WORD_X_SIZE*0 && x<option_x_l+WORD_X_SIZE*1) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_o = 7'h4f; end // O
        else if (x>=option_x_l+WORD_X_SIZE*1 && x<option_x_l+WORD_X_SIZE*2) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_o = 7'h50; end // P
        else if (x>=option_x_l+WORD_X_SIZE*2 && x<option_x_l+WORD_X_SIZE*3) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_o = 7'h54; end // T
        else if (x>=option_x_l+WORD_X_SIZE*3 && x<option_x_l+WORD_X_SIZE*4) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_o = 7'h49; end // I
        else if (x>=option_x_l+WORD_X_SIZE*4 && x<option_x_l+WORD_X_SIZE*5) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*4) >> TIMES; char_addr_o = 7'h4f; end // O
        else if (x>=option_x_l+WORD_X_SIZE*5 && x<option_x_l+WORD_X_SIZE*6) begin bit_addr_o = (x-option_x_l-WORD_X_SIZE*5) >> TIMES; char_addr_o = 7'h4e; end // N
        else begin bit_addr_o = 0; char_addr_o = 0; end                         
    end
    
    // HELP
    wire [9:0] help_x_l, help_y_t;
    assign help_x_l = INNER_MENU_X + 30; 
    //assign help_y_t = BOTTOM - INNER_MENU_OFFSET - LINE_SIZE - WORD_Y_SIZE - 25; 
    assign help_y_t = INNER_MENU_Y + 425;
    assign help_on = (y>=help_y_t && y<help_y_t+WORD_Y_SIZE && x>=help_x_l && x<help_x_l+WORD_X_SIZE*4)? 1 : 0; 
    assign row_addr_h = y-help_y_t >> TIMES;
    always @ (*) begin
        if (x>=help_x_l+WORD_X_SIZE*0 && x<help_x_l+WORD_X_SIZE*1) begin bit_addr_h = (x-help_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_h = 7'h48; end // H    
        else if (x>=help_x_l+WORD_X_SIZE*1 && x<help_x_l+WORD_X_SIZE*2) begin bit_addr_h = (x-help_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_h = 7'h45; end // E
        else if (x>=help_x_l+WORD_X_SIZE*2 && x<help_x_l+WORD_X_SIZE*3) begin bit_addr_h = (x-help_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_h = 7'h4c; end // L
        else if (x>=help_x_l+WORD_X_SIZE*3 && x<help_x_l+WORD_X_SIZE*4) begin bit_addr_h = (x-help_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_h = 7'h50; end // P
        else begin bit_addr_h = 0; char_addr_h = 0; end                         
    end
    
    // SCORE
    wire [9:0] score_x_l, score_y_t;
    assign score_x_l = SCORE_MENU_X + 25; 
    assign score_y_t = TOP + 20; 
    assign score_on = (y>=score_y_t && y<score_y_t+WORD_Y_SIZE && x>=score_x_l && x<score_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_s = y-score_y_t >> TIMES;
    always @ (*) begin
        if (x>=score_x_l+WORD_X_SIZE*0 && x<score_x_l+WORD_X_SIZE*1) begin bit_addr_s = (x-score_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_s = 7'h53; end // S    
        else if (x>=score_x_l+WORD_X_SIZE*1 && x<score_x_l+WORD_X_SIZE*2) begin bit_addr_s = (x-score_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_s = 7'h43; end // C
        else if (x>=score_x_l+WORD_X_SIZE*2 && x<score_x_l+WORD_X_SIZE*3) begin bit_addr_s = (x-score_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_s = 7'h4F; end // O 
        else if (x>=score_x_l+WORD_X_SIZE*3 && x<score_x_l+WORD_X_SIZE*4) begin bit_addr_s = (x-score_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_s = 7'h52; end // R
        else if (x>=score_x_l+WORD_X_SIZE*4 && x<score_x_l+WORD_X_SIZE*5) begin bit_addr_s = (x-score_x_l-WORD_X_SIZE*4) >> TIMES; char_addr_s = 7'h45; end // E
        else begin bit_addr_s = 0; char_addr_s = 0; end                         
    end

    wire [6:0] num1_out, num10_out, num100_out, num1000_out, num10000_out;
    wire [3:0] num1, num10, num100, num1000, num10000;
    wire [19:0] score;
    
    assign score = 56789; //여기에 score 입력
    assign num10000 = score / 10000;
    assign num1000 = (score % 10000) / 1000;
    assign num100 = (score % 1000) / 100;
    assign num10 = (score % 100) / 10;
    assign num1 = score % 10;
    
    // num_decoder
    num num1_inst (num1, num1_out); 
    num num10_inst (num10, num10_out); 
    num num100_inst (num100, num100_out); 
    num num1000_inst (num1000, num1000_out); 
    num num10000_inst (num10000, num10000_out); 
        
    // num
    wire [9:0] num_x_l, num_y_t;
    assign num_x_l = SCORE_MENU_X + 25; 
    assign num_y_t = TOP + 100; 
    assign num_on = (y>=num_y_t && y<num_y_t+WORD_Y_SIZE && x>=num_x_l && x<num_x_l+WORD_X_SIZE*5)? 1 : 0; 
    assign row_addr_n = y-num_y_t >> TIMES;
    always @ (*) begin
        if (x>=num_x_l+WORD_X_SIZE*0 && x<num_x_l+WORD_X_SIZE*1) begin bit_addr_n = (x-num_x_l-WORD_X_SIZE*0) >> TIMES; char_addr_n = num10000_out; end // 
        else if (x>=num_x_l+WORD_X_SIZE*1 && x<num_x_l+WORD_X_SIZE*2) begin bit_addr_n = (x-num_x_l-WORD_X_SIZE*1) >> TIMES; char_addr_n = num1000_out; end // 
        else if (x>=num_x_l+WORD_X_SIZE*2 && x<num_x_l+WORD_X_SIZE*3) begin bit_addr_n = (x-num_x_l-WORD_X_SIZE*2) >> TIMES; char_addr_n = num100_out; end // 
        else if (x>=num_x_l+WORD_X_SIZE*3 && x<num_x_l+WORD_X_SIZE*4) begin bit_addr_n = (x-num_x_l-WORD_X_SIZE*3) >> TIMES; char_addr_n = num10_out; end // 
        else if (x>=num_x_l+WORD_X_SIZE*4 && x<num_x_l+WORD_X_SIZE*5) begin bit_addr_n = (x-num_x_l-WORD_X_SIZE*4) >> TIMES; char_addr_n = num1_out; end // 
        else begin bit_addr_n = 0; char_addr_n = 0; end                         
    end

endmodule

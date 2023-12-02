`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// top
// 11/28 CHA
// clk_vga : 65MHz
// key_temp : bouncing keypad signal
// key_pulse : debounced keypad signal in one pulse
// key : debounced keypad signal
// random : need to work
// rand_num : 6bits random digit
//
////////////////////////////////-kys-////////////////////////////////////////
// IP Catalog ����:width= 8bit, depth=81bit.�� 2�� �ؾߵ�. (cos, sin)
// 1. coe ������ �ٿ��� �Ŀ�, �����α� ���Ͽ��� ip_user_file�� �����Ѵ�. 
// 2. IP Catalog -> 
// 3. block memory generator �˻��Ͽ� ���� ����. ->
// 4. �� ���� �ִ� Component Name��    sin_unsigned_8x81 �Ǵ� cos_signed_8x81 �� ����  
// 5. Port A Options -> 
// 6. write Width�� 8�� ����, Write Depth�� 81�� ����. ->
// 7. Enable Port Type�� Always Enabled�� ����->
// 8. Port A Options ���� �ִ� Other Options�� �̵�->
// 9. Load Init File üũ ��, browse�Ͽ� coe ���� �ֱ�.
// 10. 1~8������ �� �� �� �Ѵ�.  
//p.s. ���ذ� �� �� ��, LAB-4�� ���ּ���.
//
// 12/01 CHA
// Change sin_unsigne_8x81 to sin_unsigned_8x81
// Delete useless comment on line 83
// 
// 
//////////////////////////////////////////////////////////////////////////////


module top(
    input clk_100mhz, reset_poweron, uart_rxd,              // uart rx input
    
    inout [7:0] key_io,                                     // key inout
    
    output [3:0] red, green, blue,                          // VGA output
    output vsync, hsync
    );
    wire clk_vga, rstn, locked;
    wire [7:0] uart_rx_data;
    
    wire [4:0] key_tmp, key, key_pulse;
    
    wire [5:0] rand_num;
    
    wire [10:0] x, y;
    wire [2:0] rgb;
    wire video_on;
    
    wire ball_angle;
    
    assign rstn = (~reset_poweron) | locked;
    
    assign red = (video_on==1)? {4{rgb[2]}} : 0;
    assign green= (video_on==1)? {4{rgb[1]}} : 0;
    assign blue = (video_on==1)? {4{rgb[0]}} : 0;
    
    clk_wiz_0 clk_inst (clk_vga, reset_poweron, locked, clk_100mhz);
    
    uart_rx uart_Rx_inst(clk_100mhz, rstn, uart_rxd, , , uart_rx_data);
    debounce #(.SIZE(16), .BTN_WIDTH(5)) debounce_inst (clk_vga, rstn, key_tmp, key, key_pulse);
    keypad #(.CLK_KHZ(65000)) keypad_inst (clk_vga, rstn, key_io[7:4], key_io[3:0], key_tmp);
    
    // color : 4 -> rand_num bits : 2, color : 3 -> rand_num bits : 3, color : 6 -> rand_num bits : 6
    random #(6) random_inst(clk_vga, rstn, 20'd1106, rand_num);
    
    graph_mod graph_inst(clk_vga, rstn, x, y, uart_rx_data, key, key_pulse, rand_num, dout_cos, dout_sin, rgb, ball_angle);
    sync_mod sync_inst (clk_vga, rstn, x, y, video_on, vsync, hsync);

    // ball control
    wire signed [7:0] dout_cos, dout_sin;
    wire [6:0] addr;
    wire [7:0] din;  
    wire [0:0] we; 
    
    assign addr= ball_angle;
    
    sin_unsigned_8x81 sin_inst(clk_vga, we, addr, din, dout_sin);
    cos_signed_8x81 cos_inst(clk_vga, we, addr, din, dout_cos);
    
endmodule
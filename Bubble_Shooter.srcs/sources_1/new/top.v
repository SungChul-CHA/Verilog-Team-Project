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
// IP Catalog 생성:width= 8bit, depth=81bit.총 2번 해야됨. (cos, sin)
// 1. coe 파일을 다운한 후에, 베릴로그 파일에서 ip_user_file에 저장한다. 
// 2. IP Catalog -> 
// 3. block memory generator 검색하여 설정 들어간다. ->
// 4. 젤 위에 있는 Component Name을    sin_unsigned_8x81 또는 cos_signed_8x81 로 변경  
// 5. Port A Options -> 
// 6. write Width를 8로 설정, Write Depth를 81로 설정. ->
// 7. Enable Port Type을 Always Enabled로 변경->
// 8. Port A Options 옆에 있는 Other Options로 이동->
// 9. Load Init File 체크 후, browse하여 coe 파일 넣기.
// 10. 1~8번까지 한 번 더 한다.  
//p.s. 이해가 안 될 시, LAB-4를 봐주세요.
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
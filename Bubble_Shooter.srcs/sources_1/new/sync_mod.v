`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// sync_mod u (.clk(), .rstn(), .x(), .y(), .video_on(), .vsync(), .hsync());
// x, y : coordinate, video_on rises when x, y are in display
// Make : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module sync_mod(clk, rstn, x, y, video_on, vsync, hsync);
input clk, rstn;
output [10:0] x, y;
output video_on, vsync, hsync; 
     
reg [10:0] c_v, c_h; 
wire trig; 
    
always @ (posedge clk) begin 
    if (~rstn) c_h <= 0; 
    else if (c_h == 1343) c_h <= 0;
    else c_h <= c_h + 1;
end

assign trig = (c_h == 1343)? 1 : 0; 

always @ (posedge clk) begin 
    if (~rstn) c_v <= 0;
    else if (trig) begin
        if (c_v == 805) c_v <= 0;
        else c_v <= c_v + 1;
    end
end

assign hsync = (c_h >= 1048 && c_h < 1184) ? 0 : 1;
assign vsync = (c_v >= 771 && c_v < 777) ? 0 : 1;


assign x = (c_h<1024)? c_h : 0; //640x480 화면 구역 내의 x 좌표
assign y = (c_v<768)? c_v : 0; //640x480 화면 구역 내의 y 좌표
assign video_on = (c_h<1024 && c_v<768)? 1 : 0;

endmodule

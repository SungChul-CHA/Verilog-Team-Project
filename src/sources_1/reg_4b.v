`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// reg_4b u (.a(), .clk(), .rst(), .en(), .b());
// 4Bit Register with posedge clock, reset | a : input, b : output
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module reg_4b (a, clk, rst, en, b);
input clk, rst, en;
input [3:0] a;
output [3:0] b;
reg [3:0] b;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) b <= 4'b0;
    else if (en == 1'b1) b <= a;
end

endmodule

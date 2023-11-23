`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/26 15:24:24
// Design Name: 
// Module Name: delay_64
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module delay_64(clk, rst, din, dout);
input clk, rst;
input [7:0] din;
output [7:0] dout;

reg [63:0] reg_d;

always @ (posedge clk) begin
    if (rst)
        reg_d <= 0;
    else
        reg_d <= {reg_d[55:0], din};
end

endmodule

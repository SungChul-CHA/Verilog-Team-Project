`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// delay_8 u (.clk(), .rst(), .din(), .dout());
// 8bit Dealy Register
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module delay_8(clk, rst, din, dout);
input clk, rst;
input [7:0] din;
output [7:0] dout;

reg [7:0] reg_out[0:7];

assign dout = reg_out[7];

always @ (posedge clk) begin
    if (rst) begin
        reg_out[0] <= 0;
        reg_out[1] <= 0;
        reg_out[2] <= 0;
        reg_out[3] <= 0;
        reg_out[4] <= 0;
        reg_out[5] <= 0;
        reg_out[6] <= 0;
        reg_out[7] <= 0;
    end
    else begin
        reg_out[0] <= din;
        reg_out[1] <= reg_out[0];
        reg_out[2] <= reg_out[1];
        reg_out[3] <= reg_out[2];
        reg_out[4] <= reg_out[3];
        reg_out[5] <= reg_out[4];
        reg_out[6] <= reg_out[5];
        reg_out[7] <= reg_out[6];
    end
end

endmodule

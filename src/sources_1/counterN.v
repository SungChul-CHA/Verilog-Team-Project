`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// counterN #(.N()) u (.clk(), .rst(), .en(), .o());
// Nbit counter with reset
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module counterN #(parameter N = 4) (clk, rst, en, o);
input clk, rst, en;
output [N-1:0] o;
reg [N-1:0] o;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) o <= 0;
    else if (en == 1'b1) o <= o + 1;
end

endmodule

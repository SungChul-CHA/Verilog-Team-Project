`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// counterUD #(.N()) u (.clk(), .rst(), .up(), .down(), .o());
// N-Bit Up Down Counter
// Maker : CHa
// 
//////////////////////////////////////////////////////////////////////////////////


module counterUD #(parameter N = 4) (clk, rst, up, down, o);
input clk, rst, up, down;
output [N-1:0] o;
reg [N-1:0] o;

always @(posedge clk or posedge rst) begin
    if (rst == 1'b1) o <= 0;
    else begin
    if (up == 1'b1) o <= o+1;
    else if (down == 1'b1) o <= o-1;
    end
end

endmodule


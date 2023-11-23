`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// delay_Nd u (.clk(), .rst(), .din(), .dout());
// N clock delay shift register
// maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module delay_Nd(
    input clk,
    input rst,
    input din,
    output dout
    );

parameter N = 4; 
reg [N:1] din_d;

always @ (posedge clk or posedge rst)
begin
    if (rst) din_d <= {N{1'b0}};
    else begin
        din_d <= {din_d[N-1:1], din}; 
    end
end

assign dout = din_d[N]; 

endmodule


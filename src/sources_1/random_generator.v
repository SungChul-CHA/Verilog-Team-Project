`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// random u (.clk(), .rst(), .seed(), .rand_num());
// R-bit random generator, seed != 0
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module random(
    input clk,
    input rst,
    input [19:0] seed,
    output [7:0] rand_num
    );
    
reg [19:0] sreg0;
wire [1:0] fd_back0;

parameter R = 8;

assign fd_back0[0] = sreg0[17] ^ sreg0[0];
assign fd_back0[1] = sreg0[18] ^ sreg0[1];

always @ (posedge clk)
begin
    if (rst) sreg0 <= seed;
    else sreg0 <= {fd_back0, sreg0[19:2]};
end

assign rand_num = sreg0[R-1:0];

endmodule


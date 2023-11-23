`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_addr #(.SIZE()) u (.clk(), .rst(), .addr());
// SIZE bits address generator by clk
// 0 -> 7 -> 0
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module gen_addr #(
    parameter SIZE = 3
    )
    (
    input clk,
    input rst,
    output [SIZE-1:0] addr
    );
    reg [SIZE-1:0] addr;
    
    always @ (posedge clk, posedge rst) begin
        if (rst) addr <= 3'b0;
        else addr <= addr + 1'b1;
    end
    
endmodule

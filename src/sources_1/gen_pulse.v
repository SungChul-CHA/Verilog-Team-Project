`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gen_pulse u (.clk(), .rst(), .stable(), .pulse());
// generate pusle in 1 cyle at stable = 1
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module gen_pulse(
    input clk,
    input rst,
    input stable,
    output pulse
    );
    
    reg stable_d;
    
    always @ (posedge clk or posedge rst) begin
        if (rst) stable_d <= 1'b0;
        else stable_d <= stable;
    end
    
    assign pulse = stable & (~stable_d);
    
endmodule

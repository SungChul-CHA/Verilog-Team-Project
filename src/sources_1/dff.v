`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// dff u (.d(), .clk(), .rst(), .en(), .q());
// D Filp-Flop with posedge reset, enable
// Maker : CHA 
// 
//////////////////////////////////////////////////////////////////////////////////


module dff(
    input d,
    input clk,
    input rst,
    input en,
    output reg q
    );
    
    always @(posedge clk or posedge rst) begin
        if (rst == 1'b1) q <= 1'b0;
        else if (en == 1'b1) q <= d;
    end

endmodule

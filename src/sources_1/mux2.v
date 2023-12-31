`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// mux2 u (.a(), .b(), .s(), .o());
// 2 to 1 mux
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2(
    input a,
    input b,
    input s,
    output o
    );
    
    assign o = (s==1'b0) ? a : b;

endmodule

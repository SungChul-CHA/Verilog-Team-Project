`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// gt u (.a(), .b(), .o());
// a > b -> 1
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module gt(
    input a,
    input b,
    output reg o
    );
    
    always @ (a or b) begin
        if (a > b) o = 1;
        else o = 0;
    end

endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// mux4 u (.a(), .b(), .c(), .d(), .s(), .o());
// 4 to 1 Mux
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module mux4(
    input a,
    input b,
    input c,
    input d,
    input [1:0] s,
    output reg o
    );
    
    always @ (a or b or c or d or s) begin
        case (s)
            2'b00 : o = a;
            2'b01 : o = b;
            2'b10 : o = c;
            default : o = d;
        endcase
    end
    
endmodule

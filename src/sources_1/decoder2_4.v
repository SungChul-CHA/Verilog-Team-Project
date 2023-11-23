`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// decoder2_4 u (.i(), .o());
// 2 bit to 4 bit decoder
// Maker : CHA
//////////////////////////////////////////////////////////////////////////////////


module decoder2_4(
    input [1:0] i,
    output reg [3:0] o
    );
    
    always @ (i) begin
        case (i)
            2'b00: o = 4'b0001;
            2'b01: o = 4'b0010;
            2'b10: o = 4'b0100;
            default: o = 4'b1000;
        endcase
    end
    
endmodule

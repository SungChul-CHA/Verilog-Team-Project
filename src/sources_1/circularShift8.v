`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// circularShift8 u (.a(), .s(), .o());
// 8bit Circular Shift
// Maker : CHA
//
//////////////////////////////////////////////////////////////////////////////////


module circularShift8(
    input [7:0] a,
    input [2:0] s,
    output reg [7:0] o
    );
    
    always @ (a or s) begin //right rotation
        case (s)
            3'b000: o = a;
            3'b001: o = {a[0], a[7:1]};
            3'b010: o = {a[1:0], a[7:2]};
            3'b011: o = {a[2:0], a[7:3]};
            3'b100: o = {a[3:0], a[7:4]};
            3'b101: o = {a[4:0], a[7:5]};
            3'b110: o = {a[5:0], a[7:6]};
            default: o = {a[6:0], a[7]};
        endcase
    end
    
endmodule

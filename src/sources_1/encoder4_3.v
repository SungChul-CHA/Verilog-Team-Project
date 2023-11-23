`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// encoder4_3 u (.A(), .P());
// 4bit to 3bit Priority Encoder
// Make : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module encoder4_3(
    input [3:0] A,
    output reg [2:0] P
    );
    
    always @* begin
        casez (A)
            4'b1zzz: P = 3'b100;
            4'b01zz: P = 3'b011;
            4'b001z: P = 3'b010;
            4'b0001: P = 3'b001;
            4'b0000: P = 3'b000;
        endcase
    end

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// BCD u (.clk(), .rst(), .count());
// BCD counter output = count
// Maker : CHA
// 
//////////////////////////////////////////////////////////////////////////////////


module BCD(input clk, input rst, output reg [3:0] count);

reg [3:0] c_state;
reg [3:0] n_state;

parameter ZERO=4'b0000, ONE=4'b0001, TWO=4'b0010,
THREE=4'b0011, FOUR=4'b0100, FIVE=4'b0101, SIX=4'b0110,
SEVEN=4'b0111, EIGHT=4'b1000, NINE=4'b1001;

always @(c_state) begin
    case (c_state)
        ZERO: begin count=4'b0000; n_state=ONE; end
        ONE: begin count=4'b0001; n_state=TWO; end
        TWO: begin count=4'b0010; n_state =THREE; end
        THREE: begin count = 4'b0011; n_state = FOUR; end
        FOUR: begin count = 4'b0100; n_state = FIVE; end
        FIVE: begin count = 4'b0101; n_state = SIX; end
        SIX: begin count = 4'b0110; n_state = SEVEN; end
        SEVEN: begin count=4'b0111; n_state =EIGHT; end
        EIGHT: begin count=4'b1000; n_state =NINE; end
        default:begin count=4'b1001; n_state =ZERO; end
    endcase
end

always @(posedge clk or posedge rst)
begin
    if (rst) c_state <= ZERO;
    else c_state <= n_state;
end

endmodule

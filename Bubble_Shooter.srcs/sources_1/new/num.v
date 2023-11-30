//////////////////////////////////////////////////////////////////////////////////
// 0~9 숫자 모듈
// inst (num_in, num_out);
// Maker : min
//////////////////////////////////////////////////////////////////////////////////

module num(
    input [3:0] num_in,
    output reg [6:0] num_out
    );
    
    always @(num_in) begin
        case (num_in)
            4'b0000: num_out = 7'h30;
            4'b0001: num_out = 7'h31;
            4'b0010: num_out = 7'h32;
            4'b0011: num_out = 7'h33;
            4'b0100: num_out = 7'h34;
            4'b0101: num_out = 7'h35;
            4'b0110: num_out = 7'h36;
            4'b0111: num_out = 7'h37;
            4'b1000: num_out = 7'h38;
            4'b1001: num_out = 7'h39;
            default: num_out = 7'h30;
        endcase
    end
endmodule

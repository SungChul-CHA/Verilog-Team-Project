`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// string_detector_Moore u (.clk(), .rst(), .in(), .out());
// 1이 세 번 들어오면 1 출력
// Maker : CHa
//
//////////////////////////////////////////////////////////////////////////////////


module string_detector_Moore (clk, rst, in, out);
input clk, rst, in;
output out;
reg [1:0] c_state;
reg [1:0] n_state;
parameter SA=2'b00, SB=2'b01, 
SC=2'b10, SD=2'b11;

always @(c_state or in) begin
    case (c_state)
        SA: if (in==1'b1) n_state = SB;
            else n_state = SA;
        SB: if (in==1'b1) n_state = SC;
            else n_state = SA;
        SC: if (in==1'b1) n_state = SD;
            else n_state = SA;
        SD: if (in==1'b1) n_state = SD;
            else n_state = SA;
    endcase
end

endmodule
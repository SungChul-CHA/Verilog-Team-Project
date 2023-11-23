module gen_counter_en #(parameter SIZE = 6000000) (
    input clk,
    input rstn,
    input en,
    output counter_en,
    output rx_read
    );
    
    reg [31:0] o;
    
    always @(posedge clk) begin
        if (~rstn) o <= 0;
        else if (en)
            if (o == SIZE-1) o <= 0;
            else o <= o + 1;
    end
        
        assign counter_en = (o == SIZE-1) ? 1'b1 : 1'b0;
        assign rx_read = (o == (SIZE - 1) / 2) ? 1'b1 : 1'b0;
        
endmodule
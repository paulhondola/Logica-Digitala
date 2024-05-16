`timescale 1ns / 1ps

module clock_divider(
    input clk,
    output reg clk_out
    );

reg[31: 0] counter = 32'd0;
parameter DIVIDER = 32'd100000000;

always @(posedge clk)
begin
    counter <= counter + 32'd1;
    if(counter >= (DIVIDER - 1))
        counter <= 32'd0;
    clk_out <= (counter < (DIVIDER / 2))?1'b1:1'b0;      
end     
    
endmodule



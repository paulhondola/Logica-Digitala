`timescale 1ns / 1ps

module top(
    input clk,         
    input clk_en,
    input reset,      
    input in,          
    output reg out     
    );
    
wire clk_out;    
    
clock_divider myclock(
    .clk(clk),
    .clk_out(clk_out)
);
    
reg [2:0] state, next_state;
localparam s0 = 3'b00;
localparam s1 = 3'b11;
localparam s2 = 3'b10;
localparam s3 = 3'b10;
localparam s4 = 3'b10;
localparam s5 = 3'b10;
localparam s6 = 3'b10;

// State transition logic
always @(posedge clk_out or posedge reset) begin
    if (reset)
        state <= s0;
    else if(clk_en)
        state <= next_state;
end

always @(*) begin
    case (state)
        s0: next_state = (in == 1'b1) ? s1 : s0;
        s1: next_state = (in == 1'b0) ? s2 : s1;
        s2: next_state = (in == 1'b1) ? s3 : s0;
        s3: next_state = (in == 1'b1) ? s4 : s3;
        s4: next_state = (in == 1'b0) ? s5 : s4;
        s5: next_state = (in == 1'b0) ? s6 : s0;
        s6: next_state = s0; 
        default: next_state = s0;
    endcase
end


always @(posedge clk) begin
    if (reset)
        out <= 1'b0;
    else
        out <= (state == s6); 
end
    
endmodule



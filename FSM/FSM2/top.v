`timescale 1ns / 1ps

module top(
    input clk,
    input clk_en,
    input reset,
    input x,
    output reg [1:0] o
    );
    
wire clk_out;    
    
clock_divider myclock(
    .clk(clk),
    .clk_out(clk_out)
);
    
reg [1:0] state_reg, state_next;
localparam s0 = 2'b00;
localparam s1 = 2'b11;
localparam s2 = 2'b10;

always @(posedge clk_out, posedge reset)
begin
    if(reset)
        state_reg <= s0;
    else if(clk_en)
        state_reg <= state_next;
end

always@(*)
begin
    case(state_reg)
        s0: if(x)
                state_next = s1;
            else
                state_next = s0;
        s1: if(x)
                state_next = s1;
            else
                state_next = s2;
        s2: if(x)
                state_next = s0;
            else
                state_next = s2;
        default: state_next = state_reg;
    endcase
end

always@(*)
begin
    case(state_reg)
        s0: o = 2'b00;
        s1: o = 2'b11;
        s2: o = 2'b10;
    endcase
end
    
endmodule


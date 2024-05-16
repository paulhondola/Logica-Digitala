`define init 3'b000
`define c05 3'b001
`define c10 3'b010
`define c15 3'b011
`define c20 3'b100
`define expr 3'b101
`define latte 3'b110
`define capp 3'b111

module coffee_fsm(
input clk, rst,
input credit5, credit10,
input [1:0]cofee, 
output [2:0] current_state, 
output reg exprr, expr_1, capp)
;

reg [2:0] state_reg, state_nxt;

always @(posedge clk or posedge rst) begin
    if(rst) state_reg <= `init;
    else state_reg <= state_nxt;
end

always @(*)begin
    state_nxt = state_reg;
    exprr = 1'b0;
    expr_1 = 1'b0;
    capp = 1'b0;

    case(state_reg)
    `init:begin
        if(credit5) state_nxt = `c05;
        if(credit10) state_nxt = `c10;
    end
    `c05:begin
        if(credit5) state_nxt = `c10;
        if(credit10) state_nxt = `c15;
    end
    `c10:begin
        if(credit5) state_nxt = `c15;
        if(credit10) state_nxt = `c20;
    end
    `c15:begin
        if(credit5) state_nxt = `c20;
        if(credit10) state_nxt = `c20;
    end
    `c20:begin
        if(cofee == 1) state_nxt = `expr;
        if(cofee == 2) state_nxt = `latte;
        if(cofee == 3) state_nxt = `capp;
    end
    `expr:begin
        state_nxt = `init;
        exprr = 1'b1;
        expr_1 = 1'b0;
        capp = 1'b0;
    end
    `latte:begin
        state_nxt = `init;
        exprr = 1'b1;
        expr_1 = 1'b0;
        capp = 1'b0;
    end
    `capp:begin
        state_nxt = `init;
        exprr = 1'b0;
        expr_1 = 1'b0;
        capp = 1'b1;
    end
    endcase
end

assign current_state = state_reg;

endmodule

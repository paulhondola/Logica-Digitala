module coffee_fsm(
input clk, rst, credit5, credit10,
input [1:0]coffee_type,
output reg expr, latte, capp)
;

parameter INIT = 3'b000;
parameter C05 = 3'b001;
parameter C10 = 3'b010;
parameter C15 = 3'b011;
parameter C20 = 3'b100;
parameter EXPR = 3'b101;
parameter LATTE = 3'b110;
parameter CAPP = 3'b111;

parameter expr_coffee = 2'b01;
parameter latte_coffee = 2'b10;
parameter capp_coffee = 2'b11;

reg [2:0] state_reg, state_nxt;


// INIT state
initial begin
    state_reg = INIT;
    expr = latte = capp = 1'b0;
end

// FSM state register

always @(posedge clk or posedge rst) begin
    if(rst) state_reg <= INIT;
    else state_reg <= state_nxt;
end

// Next state logic

always @(posedge clk) begin
    case(state_reg)
        INIT:begin
            if(credit5) state_nxt = C05;
            else if(credit10) state_nxt = C10;
        end
        C05:begin
            if(credit5) state_nxt = C10;
            else if(credit10) state_nxt = C15;
        end
        C10:begin
            if(credit5) state_nxt = C15;
            else if(credit10) state_nxt = C20;
        end
        C15:begin
            if(credit5) state_nxt = C20;
            else if(credit10) state_nxt = C20;
        end
        C20:begin
            case(coffee_type)
                expr_coffee: state_nxt = EXPR;
                latte_coffee: state_nxt = LATTE;
                capp_coffee: state_nxt = CAPP;
                default: state_nxt = INIT;
            endcase
        end
    endcase
end

// Output logic

always @(posedge clk) begin
    case(state_reg)
        EXPR:begin
            expr = 1'b1;
            latte = capp = 1'b0;
        end
        LATTE:begin
            expr = capp = 1'b0;
            latte = 1'b1;
        end
        CAPP:begin
            expr = latte = 1'b0;
            capp = 1'b1;
        end
        default:begin
            expr = latte = capp = 1'b0;
        end
    endcase
end
 
endmodule

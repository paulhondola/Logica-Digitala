module top(
    input wire clk,
    input wire rst,
    input wire enable,
    output reg [2:0] out
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

parameter S0_out = 3'b000;
parameter S1_out = 3'b010;
parameter S2_out = 3'b100;

reg [1:0] state_reg, state_next;

wire clk_div_10;
wire clk_div_50;
wire clk_div_100;
wire clk_div_500;

// Clock wizard instantiation (assuming it provides divided clocks)
clk_wiz clk_wiz_inst (
    .clk_in(clk),
    .reset(rst),
    .clk_out_10(clk_div_10),
    .clk_out_50(clk_div_50),
    .clk_out_100(clk_div_100),
    .clk_out_500(clk_div_500)
);

// FSM state register
always @(posedge clk_div_10 or posedge rst) begin
    if (rst) begin
        state_reg <= S0; // Initial state
    end else begin
        state_reg <= state_next; // Next state
    end
end

// Next state logic
always @(posedge clk_div_10) begin
    case (state_reg)
        S0: state_next = (enable) ? S1 : S0;
        S1: state_next = (enable) ? S2 : S1;
        S2: state_next = (enable) ? S0 : S2;
        default: state_next = state_reg; // Keep current state
    endcase
end

// Output logic
always @(posedge clk_div_10) begin
    case (state_reg)
        S0: out = S0_out;
        S1: out = S1_out;
        S2: out = S2_out;
        default: out = S0_out; // Default case to avoid latches
    endcase
end

endmodule

module top(
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
);

parameter IDLE = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter READY = 3'b100;

reg [2:0] state_reg, state_next;

initial begin
    state_reg = IDLE;
end

// FSM state register

always @(posedge clk or posedge rst) begin
    if (rst) begin // High-active reset
        state_reg <= IDLE;
    end else begin
        state_reg <= state_next;
    end
end

// Next state logic

always @(posedge clk) begin
    case (state_reg)
        IDLE: state_next = (in) ? S1 : IDLE;
        S1: state_next = (in) ? READY : S2;
        S2: state_next = (in) ? S1 : S3;
        S3: state_next = (in) ? READY : IDLE;
        default: state_next = IDLE; // Default state
    endcase
end

// Output logic

always @(posedge clk) begin
    case (state_reg)
        IDLE: out = 1'b0;
        S1: out = 1'b0;
        S2: out = 1'b0;
        S3: out = 1'b0;
        READY: out = 1'b1;
        default: out = 1'b0; // Default case to avoid latches
    endcase

endmodule
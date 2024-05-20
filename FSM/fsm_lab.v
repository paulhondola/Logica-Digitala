module fsm(
    input wire clk,
    input wire rst,
    input wire in,
    output wire out
);
// State encoding
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b011;
parameter S4 = 3'b100;

// State registers
reg [2:0] state_reg;
reg [2:0] state_next;

// FSM States
always @(posedge clk or posedge rst) begin
    if(rst) state_reg <= S0;
    else state_reg <= state_next;
end

// Next state logic
always @(*) begin
    case(state_reg)
        S0: state_next = (in) ? S1 : S0;
        S1: state_next = (in) ? S2 : S0;
        S2: state_next = (in) ? S2 : S3;
        S3: state_next = (in) ? S4 : S0;
        S4: state_next = S0;
        default: 
    endcase
end

// Output logic
assign out = (state_reg == S4);

endmodule

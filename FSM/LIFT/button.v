module button(
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
);

localparam PARTER = 1'b0;
localparam ETAJ = 1'b1;

reg state_reg, state_next;

// FSM state register
always @(posedge clk or posedge rst) begin
    if(rst)
    state_reg <= PARTER;
    else
    state_reg <= state_next;
end

// FSM next state logic
always @(*) begin
    state_next = (in) ? ETAJ : PARTER;
end


endmodule
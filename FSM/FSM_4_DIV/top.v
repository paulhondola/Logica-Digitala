// x , y intrare
// z iesire
// z este 1 daca nr de val de intrare pt x si y de la reset este multiplu de 4
// z este 0 in rest

module top(
    input wire clk,
    input wire rst,
    input wire x,
    input wire y,
    output wire z
);

reg [1:0] state_reg, state_next;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// S0 -> am 0 de 1
// S1 -> am 1 de 1
// S2 -> am 2 de 1
// S3 -> am 3 de 1
// S4 -> am 4 de 1 -> S0

// FSM Logic

always @(posedge clk or posedge rst) begin
    if(rst)
        state_reg <= S0;
    else
        state_reg <= state_next;
end

// Next State Logic

always @(*) begin
    case(state_reg)
        S0: begin
            if(~x & ~y)
                state_next = S0;
            else if(x ^ y)
                state_next = S1;
            else if(x & y)
                state_next = S2;
        end

        S1: begin
            if(~x & ~y)
                state_next = S1;
            else if(x ^ y)
                state_next = S2;
            else if(x & y)
                state_next = S3;
        end

        S2: begin
            if(~x & ~y)
                state_next = S2;
            else if(x ^ y)
                state_next = S3;
            else if(x & y)
                state_next = S0;
        end

        S3: begin
            if(~x & ~y)
                state_next = S3;
            else if(x ^ y)
                state_next = S0;
            else if(x & y)
                state_next = S1;
        end

    endcase
end

// Output Logic

assign z = (state_reg == S0);

endmodule

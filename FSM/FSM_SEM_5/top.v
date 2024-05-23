// 1010

module top(
    input wire clk,
    input wire rst,
    input wire in,
    output reg out
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// FSM states

reg [1:0] state, next_state;

always @(posedge clk or posedge rst)
begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

// FSM next state logic and output logic

always @(*) begin

    case(state)

        S0: if(in) begin
                next_state = S1;
                out = 0;
            end
            else begin
                next_state = S0;
                out = 0;
            end

        S1: if(in) begin
                next_state = S1;
                out = 0;
            end
            else begin
                next_state = S2;
                out = 0;
            end

        S2: if(in) begin
                next_state = S3;
                out = 0;
        end else begin
                next_state = S0;
                out = 0;
        end

        S3: if(in) begin
            next_state = S1;
            out = 0;
        end else begin
            next_state =  S2;
            out = 1;
        end

    endcase

end

endmodule
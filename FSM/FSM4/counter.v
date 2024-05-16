`timescale 1ns / 1ps

module counter(
    input wire clk,
    input wire enable,
    input wire rst, 
    output reg [2:0] count 
    ); 
    
parameter IDLE = 2'b00;
parameter INCREMENT = 2'b01;

reg [1:0] state_reg, state_next;

always @(posedge clk or posedge rst)
begin
    if (rst)
        state_reg <= IDLE;
    else
        state_reg <= state_next;
end

always @(*)
begin
    case(state_reg)
        IDLE:
            begin
                if (rst)
                    state_next = IDLE;
                else
                    state_next = INCREMENT;
            end
        INCREMENT:
            begin
                if (count == 3'b111)
                    state_next = IDLE;
                else
                    state_next = INCREMENT;
            end
        default:
            state_next = IDLE;
    endcase
end

always @(posedge clk or posedge rst)
begin
    if (rst)
        count <= 3'b000;
    else
        if(enable) begin
            count <= count + 1;
        end
        else begin
            count <= count;
        end    
end    
    
endmodule



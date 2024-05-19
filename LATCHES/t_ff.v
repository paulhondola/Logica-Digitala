// Toggle flip-flop

// 1. Description

// if t is 1 then q is the same as d
// if t is 0 then q is the same as q_prev

module t_ff(
    input clk,
    input rst,
    input t,
    input d,
    output reg q
);

always @(posedge clk or posedge rst)begin
    if(rst)
        q <= 1'b0;
    else if(t)
        q <= d;
end
endmodule
module d_ff(
    input clk,
    input rst,
    input d,
    output reg q
);

// High active reset -> active on rising edge 1

always @(posedge clk or posedge rst)begin
    if(rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
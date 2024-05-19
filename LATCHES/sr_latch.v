module sr_latch(
    input clk,
    input rst,
    input s,
    input r,
    output reg q
);

always @(posedge clk or posedge rst)begin
    if(rst)
        q <= 1'b0;
    else if(s)
        q <= 1'b1;
    else if(r)
        q <= 1'b0;
end

endmodule
module timer(input clk, input rst, input ovr, output reg [31:0] t);

counter instance (
    .clk(clk),
    .rst(rst),
    .ovr(ovr)
);

always @(posedge ovr) begin

    if (rst == 0)
        t <= 32'd0;
    else
        t <= t + 1;

end

endmodule
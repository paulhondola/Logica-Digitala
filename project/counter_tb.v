module counter_tb;

reg clk, rst;
wire ovr;

counter DUT (
    .clk(clk),
    .rst(rst),
    .ovr(ovr)
);

initial begin
    clk = 1'b0;
    rst = 1'b0;
    #10 rst = 1'b1;
end

forever begin
    #10 clk = ~clk;
end

endmodule
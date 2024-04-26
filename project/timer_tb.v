module timer_tb;

reg clk, rst;
reg [31:0] t;
wire ovr;

timer DUT (
    .clk(clk),
    .rst(rst),
    .ovr(ovr),
    .t(t)
);

endmodule
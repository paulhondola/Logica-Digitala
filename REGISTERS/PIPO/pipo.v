module pipo_8(
    input clk,
    input rst,
    input [7:0] parallel_in,
    output reg [7:0] parallel_out
);

d_ff ff0(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[0]),
    .q(parallel_out[0])
);

d_ff ff1(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[1]),
    .q(parallel_out[1])
);

d_ff ff2(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[2]),
    .q(parallel_out[2])
);

d_ff ff3(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[3]),
    .q(parallel_out[3])
);

d_ff ff4(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[4]),
    .q(parallel_out[4])
);

d_ff ff5(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[5]),
    .q(parallel_out[5])
);

d_ff ff6(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[6]),
    .q(parallel_out[6])
);

d_ff ff7(
    .clk(clk),
    .rst(rst),
    .d(parallel_in[7]),
    .q(parallel_out[7])
);

endmodule
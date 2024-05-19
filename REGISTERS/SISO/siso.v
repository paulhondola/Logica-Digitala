module siso(
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg serial_out
);

wire q0, q1, q2, q3, q4, q5, q6, q7;

d_ff d_ff_0(
    .clk(clk),
    .rst(rst),
    .d(serial_in),
    .q(q0)
);

d_ff d_ff_1(
    .clk(clk),
    .rst(rst),
    .d(q0),
    .q(q1)
);

d_ff d_ff_2(
    .clk(clk),
    .rst(rst),
    .d(q1),
    .q(q2)
);

d_ff d_ff_3(
    .clk(clk),
    .rst(rst),
    .d(q2),
    .q(q3)
);

d_ff d_ff_4(
    .clk(clk),
    .rst(rst),
    .d(q3),
    .q(q4)
);

d_ff d_ff_5(
    .clk(clk),
    .rst(rst),
    .d(q4),
    .q(q5)
);

d_ff d_ff_6(
    .clk(clk),
    .rst(rst),
    .d(q5),
    .q(q6)
);

d_ff d_ff_7(
    .clk(clk),
    .rst(rst),
    .d(q6),
    .q(q7)
);

assign serial_out = q7;

endmodule
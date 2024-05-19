module rca_16(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output [15:0] sum,
    output cout
);

wire [1:0] c;

rca_8 rca_0(
    .a(a[7:0]),
    .b(b[7:0]),
    .cin(cin),
    .sum(sum[7:0]),
    .cout(c[0])
);

rca_8 rca_1(
    .a(a[15:8]),
    .b(b[15:8]),
    .cin(c[0]),
    .sum(sum[15:8]),
    .cout(c[1])
);

assign cout = c[1];

endmodule
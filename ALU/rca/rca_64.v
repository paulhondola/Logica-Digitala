module rca_64(
    input [63:0] a,
    input [63:0] b,
    input cin,
    output [63:0] sum,
    output cout
);

wire [1:0] c;

rca_32 rca_0(
    .a(a[31:0]),
    .b(b[31:0]),
    .cin(cin),
    .sum(sum[31:0]),
    .cout(c[0])
);

rca_32 rca_1(
    .a(a[63:32]),
    .b(b[63:32]),
    .cin(c[0]),
    .sum(sum[63:32]),
    .cout(c[1])
);

assign cout = c[1];

endmodule
module rca_32(
    input [31:0] a,
    input [31:0] b,
    input cin,
    output [31:0] sum,
    output cout
);

wire [1:0] c;

rca_16 rca_0(
    .a(a[15:0]),
    .b(b[15:0]),
    .cin(cin),
    .sum(sum[15:0]),
    .cout(c[0])
);

rca_16 rca_1(
    .a(a[31:16]),
    .b(b[31:16]),
    .cin(c[0]),
    .sum(sum[31:16]),
    .cout(c[1])
);

assign cout = c[1];

endmodule
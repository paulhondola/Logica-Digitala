module rcs_8(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire borrow_in,
    output wire [7:0] sum,
    output wire borrow_out
);

wire [7:0] b;

fsc fsc_0(
    .a(a[0]),
    .b(b[0]),
    .borrow_in(borrow_in),
    .sum(sum[0]),
    .borrow_out(b[0])
);

fsc fsc_1(
    .a(a[1]),
    .b(b[1]),
    .borrow_in(b[0]),
    .sum(sum[1]),
    .borrow_out(b[1])
);

fsc fsc_2(
    .a(a[2]),
    .b(b[2]),
    .borrow_in(b[1]),
    .sum(sum[2]),
    .borrow_out(b[2])
);

fsc fsc_3(
    .a(a[3]),
    .b(b[3]),
    .borrow_in(b[2]),
    .sum(sum[3]),
    .borrow_out(b[3])
);

fsc fsc_4(
    .a(a[4]),
    .b(b[4]),
    .borrow_in(b[3]),
    .sum(sum[4]),
    .borrow_out(b[4])
);

fsc fsc_5(
    .a(a[5]),
    .b(b[5]),
    .borrow_in(b[4]),
    .sum(sum[5]),
    .borrow_out(b[5])
);

fsc fsc_6(
    .a(a[6]),
    .b(b[6]),
    .borrow_in(b[5]),
    .sum(sum[6]),
    .borrow_out(b[6])
);

fsc fsc_7(
    .a(a[7]),
    .b(b[7]),
    .borrow_in(b[6]),
    .sum(sum[7]),
    .borrow_out(b[7])
);

assign borrow_out = b[7];

endmodule
module comparator(
    input wire [63:0] a,
    input wire [63:0] b,
    output wire equal,
    output wire greater,
    output wire less
);

    assign equal = (result == 0);
    assign greater = (result > 0);
    assign less = (result < 0);

endmodule
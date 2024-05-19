module mux_2_1(
    input a,
    input b,
    input sel,
    output reg out
);

out = sel ? b : a;

endmodule
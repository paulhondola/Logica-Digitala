module mux_4_1(
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [1:0] sel,
    output reg [15:0] out
);

case (sel)

    2'b00: out = a;
    2'b01: out = b;
    2'b10: out = c;
    2'b11: out = d;
    default: out = 16'b0;

endcase

endmodule
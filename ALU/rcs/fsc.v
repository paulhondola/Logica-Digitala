// full subractor cell

module fsc(
    input wire a,
    input wire b,
    input wire borrow_in,
    output wire sum,
    output wire borrow_out
);

assign sum = a ^ b ^ borrow_in;
assign borrow_out = (~a & b) | ((~a | b) & borrow_in);

endmodule
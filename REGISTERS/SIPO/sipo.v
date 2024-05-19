module sipo(
    input wire clk,            // Clock input
    input wire reset,          // Reset input to clear the register
    input wire serial_in,      // Serial data input
    output wire [7:0] parallel_out // 8-bit parallel data output
);

    // Intermediate wires to connect the flip-flops
    wire q0, q1, q2, q3, q4, q5, q6, q7;

    // Instantiate 8 D flip-flops
    d_ff ff0 (.clk(clk), .rst(rst), .d(serial_in), .q(q0));
    d_ff ff1 (.clk(clk), .rst(rst), .d(q0), .q(q1));
    d_ff ff2 (.clk(clk), .rst(rst), .d(q1), .q(q2));
    d_ff ff3 (.clk(clk), .rst(rst), .d(q2), .q(q3));
    d_ff ff4 (.clk(clk), .rst(rst), .d(q3), .q(q4));
    d_ff ff5 (.clk(clk), .rst(rst), .d(q4), .q(q5));
    d_ff ff6 (.clk(clk), .rst(rst), .d(q5), .q(q6));
    d_ff ff7 (.clk(clk), .rst(rst), .d(q6), .q(q7));

    // Assign the outputs of the flip-flops to the parallel output
    assign parallel_out = {q7, q6, q5, q4, q3, q2, q1, q0};

endmodule

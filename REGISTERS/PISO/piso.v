module piso_register (
    input wire clk,             // Clock input
    input wire reset,           // Reset input to clear the register
    input wire load,            // Load control signal
    input wire [7:0] parallel_in, // 8-bit parallel data input
    output wire serial_out      // Serial data output
);

    // Intermediate wires to connect the flip-flops
    wire q0, q1, q2, q3, q4, q5, q6, q7;

    // Instantiate 8 D flip-flops
    d_flip_flop ff0 (.clk(clk), .reset(reset), .load(load), .d(serial_out), .d_parallel(parallel_in[0]), .q(q0));
    d_flip_flop ff1 (.clk(clk), .reset(reset), .load(load), .d(q0), .d_parallel(parallel_in[1]), .q(q1));
    d_flip_flop ff2 (.clk(clk), .reset(reset), .load(load), .d(q1), .d_parallel(parallel_in[2]), .q(q2));
    d_flip_flop ff3 (.clk(clk), .reset(reset), .load(load), .d(q2), .d_parallel(parallel_in[3]), .q(q3));
    d_flip_flop ff4 (.clk(clk), .reset(reset), .load(load), .d(q3), .d_parallel(parallel_in[4]), .q(q4));
    d_flip_flop ff5 (.clk(clk), .reset(reset), .load(load), .d(q4), .d_parallel(parallel_in[5]), .q(q5));
    d_flip_flop ff6 (.clk(clk), .reset(reset), .load(load), .d(q5), .d_parallel(parallel_in[6]), .q(q6));
    d_flip_flop ff7 (.clk(clk), .reset(reset), .load(load), .d(q6), .d_parallel(parallel_in[7]), .q(q7));

    // Assign the output of the last flip-flop to serial_out
    assign serial_out = q7;

endmodule

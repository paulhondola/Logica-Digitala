module d_flip_flop (
    input wire clk,
    input wire reset,
    input wire load,
    input wire d,
    input wire d_parallel,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0; // Reset the output to 0
        else if (load)
            q <= d_parallel; // Load parallel data
        else
            q <= d; // Shift data
    end
endmodule

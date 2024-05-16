`timescale 1ns / 1ps

module top_tb();

    // Inputs
    reg clk;
    reg clk_en;
    reg reset;
    reg x;

    // Outputs
    wire [1:0] o;

    // Instantiate the Unit Under Test (UUT)
    top uut (
        .clk(clk),
        .clk_en(clk_en),
        .reset(reset),
        .x(x),
        .o(o)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz Clock
    end

    // Initialize Inputs and run the test
    initial begin
        // Initialize Inputs
        clk_en = 0;
        reset = 1;
        x = 0;

        // Reset the system
        #10;
        reset = 0;
        clk_en = 1;

        // Apply test cases
        #10 x = 1;  // Test transition from s0 to s1
        #20 x = 0;  // Test transition from s1 to s2
        #20 x = 1;  // Test transition from s2 to s0

        #10 x = 0;  // Remain in s0
        #20 x = 1;  // Move to s1 again
        #20 x = 0;  // Transition to s2
        #20 x = 0;  // Stay at s2

        #20;
        // Check recovery from reset
        reset = 1;
        #10 reset = 0;
        #10 x = 1;  // Should go to s0 then s1

        #100;  // Wait some time to observe the behavior
        
        $finish;  // End simulation
    end

endmodule

module clock_divider_50mhz_to_1hz_tb();

reg clk, rst;
wire clk_out;

clock_divider_50mhz_to_1hz uut(
    .clk(clk),
    .reset(rst),
    .clk_out(clk_out)
);

 initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Release reset after a few clock cycles
        #100 reset = 0;

        // Run the simulation for a sufficient amount of time
        #500000000; // Simulate for 500 million clock cycles -> 10 seconds
        $finish;
    end

// Generate the 50 MHz clock
always #10 clk = ~clk; // 50 MHz clock period is 20 ns (1/50MHz = 20ns)


endmodule
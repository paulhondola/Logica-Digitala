module clk_wiz_tb;

    reg clk;
    reg reset;
    wire clk_out_10;
    wire clk_out_50;
    wire clk_out_100;
    wire clk_out_500;

    // Instantiate the clock divider
    clk_wiz uut(
        .clk(clk),
        .rst(reset),
        .clk_div_10(clk_out_10),
        .clk_div_50(clk_out_50),
        .clk_div_100(clk_out_100),
        .clk_div_500(clk_out_500)
    )

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Release reset after a few clock cycles
        #20 reset = 0;

        // Run the simulation for a sufficient amount of time
        #200; // Simulate for 200 time units
        $finish;
    end

    // Generate the input clock
    always #5 clk = ~clk; // 100 MHz clock period is 10 ns (1/100MHz = 10ns)

endmodule

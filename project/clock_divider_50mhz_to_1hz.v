module clock_divider_50mhz_to_1hz(
    input wire clk,        // 50 MHz input clock
    input wire reset,      // Reset signal
    output reg clk_out     // 1 Hz output clock
);

// 26-bit counter for dividing 50 MHz to 1 Hz
reg [25:0] counter;

always @(posedge clk or edge reset) begin

    if (reset) begin
        counter <= 0;
        clk_out <= 0;
    end

    else begin
        if (counter == 26'd49999999) begin
            counter <= 26'd0;
            clk_out <= 1;  // Toggle the output clock
        end else begin
            counter <= counter + 1;
            clk_out <= 0;
        end
    end

end

endmodule

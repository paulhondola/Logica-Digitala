// Code your design here
module clk_wiz (
    input clk,
    input rst,
    output reg clk_div_10,
    output reg clk_div_50,
    output reg clk_div_100,
    output reg clk_div_500
);

parameter DIVIDER_10 = 10;
parameter DIVIDER_50 = 50;
parameter DIVIDER_100 = 100;
parameter DIVIDER_500 = 500;

  reg [3:0] counter_10;
  reg [3:0] counter_50;
  reg [3:0] counter_100;
  reg [3:0] counter_500;
  
// Initialize the divided clock and counter
initial begin
    counter_10 = 0;
    counter_50 = 0;
    counter_100 = 0;
    counter_500 = 0;
end

always @(posedge clk or posedge rst) begin
    if(rst) begin

        counter_10 <= 0;
        counter_50 <= 0;
        counter_100 <= 0;
        counter_500 <= 0;

        clk_div_10 <= 0;
        clk_div_50 <= 0;
        clk_div_100 <= 0;
        clk_div_500 <= 0;

    end else begin

        if(counter_10 == DIVIDER_10 - 1) begin
            counter_10 <= 0;
            clk_div_10 <= ~clk_div_10;
        end else begin
            counter_10 <= counter_10 + 1;
        end

        if(counter_50 == DIVIDER_50 - 1) begin
            counter_50 <= 0;
            clk_div_50 <= ~clk_div_50;
        end else begin
            counter_50 <= counter_50 + 1;
        end

        if(counter_100 == DIVIDER_100 - 1) begin
            counter_100 <= 0;
            clk_div_100 <= ~clk_div_100;
        end else begin
            counter_100 <= counter_100 + 1;
        end

        if(counter_500 == DIVIDER_500 - 1) begin
            counter_500 <= 0;
            clk_div_500 <= ~clk_div_500;
        end else begin
            counter_500 <= counter_500 + 1;
        end

    end
end

endmodule
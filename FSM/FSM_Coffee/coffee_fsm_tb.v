`timescale 1ns / 1ps

module coffee_fsm_tb;

reg clk, rst, credit5, credit10;
reg [1:0] coffee_type;
wire expr, latte, capp;

coffee_fsm dut (
    .clk(clk),
    .rst(rst),
    .credit5(credit5),
    .credit10(credit10),
    .coffee_type(coffee_type),
    .expr(expr),
    .latte(latte),
    .capp(capp)
);

initial begin
clk = 0;
rst = 1;
credit5 = 0;
credit10 = 0;
coffee_type = 0;
#10 rst = 0;

#20;
credit5 = 1;
#10;
credit5 = 0;
credit10 = 1;
#10;
credit5 = 1;
#5 credit5 = 0;
credit10 = 1;
#10;

coffee_type = expr_coffee;
#10;

coffee_type = latte_coffee;
#10;
coffee_type = capp_coffee;
#10;

rst = 1;
#10;
$stop;
end



initial begin
forever #5 clk = ~clk;
end

endmodule

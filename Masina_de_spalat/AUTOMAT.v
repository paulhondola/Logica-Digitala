module AUTOMAT(input clk, rst, on_off, speed, 
               output [6:0]stare,
               output led_speed);
             
wire [1:0]stare_a;
wire astept;
	
CLK_DIVIDER clkdiv(.clk(clk), .rst(rst), .Q(astept));
SPAL cof(.clk(astept), .rst(rst), .on_off(on_off), .speed(speed), .led_speed(led_speed), .state(stare_a));	
SEVEN_SEGMENT sev(.in(stare_a), .out(stare));
	
endmodule

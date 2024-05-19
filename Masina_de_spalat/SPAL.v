module SPAL(input clk, rst, on_off, speed,
            output led_speed,
            output [1:0]state);
            
reg [1:0]state_reg, state_nxt;

always @(posedge clk, negedge rst)
 begin
 	if(rst == 0)
 		state_reg <= 0;
 	else
 		state_reg <= state_nxt;
 end

always @(state_reg, on_off, speed)
 begin
 	state_nxt = state_reg;
 	case(state_reg)
 		2'b00: if(on_off) state_nxt = 2'b01;
 		2'b01: 
 		 begin
 		 	if(on_off == 0) state_nxt = 2'b00;
 		 	else if(speed) state_nxt = 2'b11; 
 		 end
 		2'b11:
 		 begin
 		 	if(on_off == 0) state_nxt = 2'b00;
 		 	else if(speed == 0) state_nxt = 2'b01; 
 		 end
 	endcase
 end
assign state = state_reg;
assign led_speed = state_reg[1] & state_reg[0];

endmodule

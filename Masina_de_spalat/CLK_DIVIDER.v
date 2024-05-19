module CLK_DIVIDER(input clk, rst,
                 output Q);

reg Q_reg, Q_nxt;
reg [24:0]counter_reg, counter_nxt;

always @(posedge clk or negedge rst)
begin
	if(rst == 0)
	  begin
		Q_reg <= 0;
		counter_reg <= 0;
	  end
	else
	  begin
	  	Q_reg <= Q_nxt;
	  	counter_reg <= counter_nxt;
	  end
end

always @(counter_reg, Q_reg)
begin
	if(counter_reg == 25000000)
	  begin
		counter_nxt = 0;
		Q_nxt = ~Q_reg;
	  end
	else
	  begin
		counter_nxt = counter_reg + 1;
		Q_nxt = Q_reg;
	  end
end

assign Q = Q_reg;
endmodule

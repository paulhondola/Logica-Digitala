module data_processing(
    input clk, rst,
    input [4:0] c,
    input [7:0] n,
    output is_n_0,
    output [31:0] out_data
);

reg [31:0] an_reg, an_next;
reg [31:0] an1_reg, an1_next;
reg [31:0] an2_reg, an2_next;
reg [7:0] n_reg, n_next;

assign is_n_0 = (n_next == 0) ? 1'b1 : 1'b0;

always @(posedge clk)
begin
    
    if(rst)
    begin
        an_reg <= 0;
        an1_reg <= 0;
        an2_reg <= 0;
        n_reg <= 0;
    end
    else
    begin
        an_reg <= an_next;
        an1_reg <= an1_next;
        an2_reg <= an2_next;
        n_reg <= n_next;
    end
end

always @(*)
begin

    an_next = an_reg;
    an1_next = an1_reg;
    an2_next = an2_reg;
    n_next = n_reg;

    if(c[0])
    begin
        an1_next = 1;
        an2_next = 0;
        n_next = n;
        an_next = 0;
    end
    else
    if(c[1])
    begin
        an_next = an1_reg + an2_reg;
    end

end

endmodule
module counter(input clk, input rst, output reg ovr);

`define MAX_CLK_COUNT 32'd50000000

reg [31:0] clk_count;

initial begin
    ovr = 1'b0;
    clk_count = 32'd0;
end

always @(posedge clk) begin

    ovr = 1'b0;

    if(rst == 0)
        clk_count <= 32'd0;
    else
        clk_count <= clk_count + 1;

    
    if(clk_count == `MAX_CLK_COUNT) begin
        ovr = 1'b1;
        clk_count <= 32'd0;
    end

end

endmodule
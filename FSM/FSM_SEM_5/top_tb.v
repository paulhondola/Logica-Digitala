module top_tb;

reg clk, rst, in;
wire out;

top uut(
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

initial begin

    // set clk to 0 and activate reset
    clk = 0;
    rst = 1;

    #10 rst = 0;
end

always forever #5 clk = ~clk;

initial begin
    // sequence 1010
    #100

    #10 in = 1;

    #10 in = 0;

    #10 in = 1;

    #10 in = 0;

    // end simulation

    $finish;
end

endmodule
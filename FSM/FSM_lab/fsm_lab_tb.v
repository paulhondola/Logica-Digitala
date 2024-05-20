module fsm_tb;

reg clk, rst, in;
wire out;



initial begin
    rst = 1;
    clk = 1;

    #10;

    rst = 0;

    #50;
end

always forever #10 clk = ~clk;

initial begin
    #10
    // testam cazul 1101
    in = 1;
    #50;
    in = 1;
    #50;
    in = 0;
    #50;
    in = 1;
    #50;

    // testam cazul 100011101
    in = 1;
    #50;
    in = 0;
    #50;
    in = 0;
    #50;
    in = 0;
    #50;
    in = 1;
    #50;
    in = 1;
    #50;
    in = 1;
    #50;
    in = 0;
    #50;
    in = 1;
    #50;

    // activate reset
    rst = 1;

end



endmodule

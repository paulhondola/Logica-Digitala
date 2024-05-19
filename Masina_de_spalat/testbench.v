module testbench();

    //Inputs
    reg clk;
    reg rst;
    reg on_off;
    reg speed;

    //Outputs
    wire led_speed;
    wire [1:0]state;

    SPAL DUT(
        .clk(clk),
        .rst(rst),
        .on_off(on_off),
        .speed(speed),
        .led_speed(led_speed),
        .state(state)
    );

    initial begin
        //initialize
        clk = 0;
        rst = 0; 
        #100;
        #25 rst = 1; 
        
        #25 on_off = 1;
        #25 speed = 1;
        #25 speed = 0;
        #25 speed = 1;
        #25 on_off = 0;
        

    end
    always
     #5 clk = ~clk;

endmodule

module full_adder_tb;

reg a,b,cin;
wire sum,carry;

full_adder_s DUT(a,b,cin,sum,carry);

initial begin

    integer i = 0;
    integer total_tests = 8; // 2^3

    // Initialize Inputs
    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    
    // Wait 100 ns for global reset to finish
    #100;

    for(i = 0; i < total_tests; i = i + 1)
        {a, b, cin} = i;
        #10 $display("a=%b b=%b cin=%b sum=%b carry=%b", a, b, cin, sum, carry);

end
                
endmodule
module rca_tb;

reg [7:0]a,b;
reg cin;
wire [7:0]sum;
wire cout;

rca DUT(a,b,cin,sum,cout);

integer i = 0;
integer total_tests = 131072; // 2^17

initial begin

    // Initialize Inputs
    a = 8'b00000000;
    b = 8'b00000000;
    cin = 1'b0;
    
    // Wait 100 ns for global reset to finish
    #100;

    

	for (i = 0; i < total_tests; i = i + 1)
		#30 {a, b, cin} = i;
		
end

endmodule
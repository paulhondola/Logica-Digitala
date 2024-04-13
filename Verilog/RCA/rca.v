// Ripple Carry Adder (RCA) module with 8-bit input and output

module rca(
    input [7:0] a,b,
    input cin,
    output [7:0] sum,
    output cout
);

wire c1,c2,c3,c4,c5,c6,c7; //Carry out of each full adder

fac fa0(a[0],b[0],cin,sum[0],c1);
fac fa1(a[1],b[1],c1,sum[1],c2);
fac fa2(a[2],b[2],c2,sum[2],c3);
fac fa3(a[3],b[3],c3,sum[3],c4);
fac fa4(a[4],b[4],c4,sum[4],c5);
fac fa5(a[5],b[5],c5,sum[5],c6);
fac fa6(a[6],b[6],c6,sum[6],c7);
fac fa7(a[7],b[7],c7,sum[7],cout);

endmodule
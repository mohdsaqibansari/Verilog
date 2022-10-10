//A 4-bit Carry Look Ahead Adder starts here.
module cla_4bit(s,cout,a,b,cin);
input [3:0]a,b;
input cin;
output [3:0]s;
output cout;
wire p0,g0,p1,g1,p2,g2,p3,g3;
wire [3:1]c;
assign p0=a[0]^b[0],p1=a[1]^b[1],p2=a[2]^b[2],p3=a[3]^b[3];
assign g0=a[0]&b[0],g1=a[1]&b[1],g2=a[2]&b[2],g3=a[3]&b[3];
assign c[1]=(cin&p0)|g0;
assign c[2]=(((cin&p0)|g0)&p1)|g1;
assign c[3]=((((((cin&p0)|g0)&p1)|g1)&p2))|g2;
assign cout=(((((((cin&p0)|g0)&p1)|g1)&p2)|g2)&p3)|g3;
assign s[0]=p0^cin;
assign s[1]=p1^c[1];
assign s[2]=p2^c[2];
assign s[3]=p3^c[3];
endmodule 
// 4-bit CLA module ends here.
//----------------------------------
//----------------------------------
//----------------------------------

// 16-bit ALU module starts here.
module adder_16_bit(X,Y,Z,zero,sign,carry,parity,overflow);
input [15:0]X,Y;
output [15:0]Z;
output sign,zero,carry,parity,overflow;
wire [3:1]c;
assign sign =Z[15];
assign zero=~|Z;
assign parity=~^Z;
assign overflow=(X[15]&Y[15]&~Z[15])|(~X[15]&~Y[15]&Z[15]);
// Four times instantiation of 4-bit CLA module.
cla_4bit adder0(Z[3:0],c[1],X[3:0],Y[3:0],1'b0);
cla_4bit adder1(Z[7:4],c[2],X[7:4],Y[7:4],c[1]);
cla_4bit adder2(Z[11:8],c[3],X[11:8],Y[11:8],c[2]);
cla_4bit adder3(Z[15:12],carry,X[15:12],Y[15:12],c[3]);
endmodule

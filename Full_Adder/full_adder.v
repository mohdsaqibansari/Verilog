module half_adder(s,c,a,b);
input a,b;
output s,c;
assign s=a^b;
assign c=a&b;
endmodule

module full_adder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;
wire w1,w2,w3;

half_adder ha0(w1,w2,a,b);
half_adder ha1(sum,w3,w1,cin);
or or0(cout,w3,w2);
endmodule

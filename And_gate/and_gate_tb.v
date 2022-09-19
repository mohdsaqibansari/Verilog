// `timescale 1ns/1ns
`include "and_gate.v"

module and_gate_tb;
reg a,b;
wire y;
and_gate dut(y,a,b);
initial begin

$dumpfile("and_gate.vcd");
$dumpvars(0,and_gate_tb);

a=0;b=0;
#20
a=0;b=1;
#20
a=1;b=0;
#20
a=1;b=1;
#20

$display("Testing completed.");
end
endmodule
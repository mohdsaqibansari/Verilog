`include "half_adder.v"

module half_adder_tb;

reg a,b;
wire s,c;

half_adder dut(s,c,a,b);

initial begin
  $dumpfile("half_adder.vcd");
  $dumpvars(0,half_adder_tb);

  a=0;b=0;
  #10;
  a=0;b=1;
  #10;
  a=1;b=0;
  #10;
  a=1;b=1;
  #10;
  $display("Testing done");
end
endmodule
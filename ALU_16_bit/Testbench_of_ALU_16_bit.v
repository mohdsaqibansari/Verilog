// Testbench for ALU_16_bit

module adder_16_bit_tb();
reg [15:0]X,Y;
wire [15:0]Z;
wire S,ZR,CY,P,V;
adder_16_bit dut(X,Y,Z,ZR,S,CY,P,V);
initial 
begin 
#5;
X=16'h8fff;Y=16'h8000;
#5;
X=16'hfffe;Y=16'h0002;
#5;
X=16'hAAAA;Y=16'h5555;
#5;
$finish;
end
endmodule

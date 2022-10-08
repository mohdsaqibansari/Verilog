`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 04:25:21 PM
// Design Name: 
// Module Name: mux_16x1_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_16x1_tb();
reg [15:0]I; reg[3:0]S; wire Y;
mux_16x1 dut(.in(I),.sel(S),.out(Y));
initial 
begin 
$monitor($time,"I=%h,S=%h,Y=%b",I,S,Y);
#5;
I=16'h3F0A; S=4'h0;
#5;
S=4'h1;
#5;
S=4'h6;
#5;
S=4'hC;
#5;
$finish;
end
endmodule

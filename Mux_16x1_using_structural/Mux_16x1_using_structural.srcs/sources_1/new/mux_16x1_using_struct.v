`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2022 05:50:22 PM
// Design Name: 
// Module Name: mux_16x1_using_struct
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

//2x1 MUX is defined here using AOI gates only.
module mux_2x1(I,sel,y);
input [1:0]I;
input sel;
output y;
wire [2:0]t;
not not1(t[1],sel);
and and1(t[0],I[1],sel);
and nd2(t[2],t[1],I[0]);
or or1(y,t[0],t[1]);
endmodule
//2X1 Mux module ends here.

//4X1 Mux module starts here.
module mux_4x1(I,sel,y);
input [3:0]I;
input [1:0]sel;
output y;
wire [1:0]t;

mux_2x1 m0(I[1:0],sel[0],t[0]);
mux_2x1 m1(I[3:2],sel[0],t[1]);
mux_2x1 m2(t,sel[1],y);
endmodule
// 4X1 Mux module ends here.

//16x1 Mux strats here.
module mux_16x1_using_struct(I,sel,y);
input [15:0]I;
input [3:0]sel;
output y;
wire [3:0]t;

mux_4x1 m0(I[3:0],sel[1:0],t[0]);
mux_4x1 m1(I[7:4],sel[1:0],t[1]);
mux_4x1 m2(I[11:8],sel[1:0],t[2]);
mux_4x1 m3(I[15:12],sel[1:0],t[3]);
mux_4x1 m4(t,sel[3:2],y);
endmodule
//16x1 Mux module ends here.
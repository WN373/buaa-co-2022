`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:56 09/19/2022 
// Design Name: 
// Module Name:    signed_verified2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module signed_verified2(
   input clk,
	input reset,
	input [3:0] a,
	input [3:0] b,
	output [3:0] ans1,
	output [3:0] ans2,
	output [3:0] ans3
    );
	 assign ans1 = (1'b1==1'b1) ? a>>>b : 0;
	 assign ans2 = (1'b1==1'b1) ? $signed(a)>>>b : 0;
	 assign ans3 = (1'b1==1'b1) ? $signed(a)>>>b : 4'b0;

endmodule

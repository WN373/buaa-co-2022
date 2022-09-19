`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:06:45 09/20/2022 
// Design Name: 
// Module Name:    CombinCircuit 
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
module ALU0(
		input [3:0] inA, 
		input [3:0] inB, 
		input [1:0] op,
		output [3:0]ans
    );
	 
	 assign ans = (op === 2'b00) ? (inA & inB) : ((op == 2'b01) ? (inA | inB) : (op=== 2'b10) ? (inA ^ inB) : (inA + inB) );
	 

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:33:50 09/20/2022 
// Design Name: 
// Module Name:    SeqCircuit1 
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
module counting(
	input [1:0] num,
	input clk,
	output ans
    );
	 reg [1:0] stat;
	 initial begin
		stat = 0
	 end
	`define S0 2'b00
	`define S1 2'b01
	`define S2 2'b10
	`define S3 2'b11
	
	
	always @(posedge clk) begin
		case(stat)
			`S0: stat <= (num==1) ? `S1 : `S0;
			`S1: stat <= (num==2) ? `S2 : (num==1) ? `S1 : `S0;
			`S2: stat <= (num==3) ? `S3 : (num==1) ? `S1 : `S2;
			`S3: stat <= (num==3) ? `S3 : (num==1) ? `S1 : `S0;
			default: ;
		endcase
	end
	
	assign ans = (stat==`S3)?1:0;



endmodule

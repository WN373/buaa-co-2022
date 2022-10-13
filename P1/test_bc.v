`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:11:52 10/10/2022
// Design Name:   BlockChecker
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P1/test_bc.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BlockChecker
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bc;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] in;

	// Outputs
	wire result;

	// Instantiate the Unit Under Test (UUT)
	BlockChecker uut (
		.clk(clk), 
		.reset(reset), 
		.in(in), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		//#100;
		
	in = "b";
#2 in = "e";
#2 in = "g";
#2 in = "i";
#2 in = "n";
#2 in = " ";
#2 in = "e";
#2 in = "n";
#2 in = "d";
#2 in = " ";
#2 in = "e";
#2 in = "n";
#2 in = "d";
#2 in = " ";
#2 in = "b";
#2 in = "e";
#2 in = "g";
#2 in = "i";
#2 in = "n";
#2 in = " ";
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule


`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:07:01 11/12/2022
// Design Name:   mips
// Module Name:   /home/co-eda/Documents/buaa-co-2022/P5/P5CPU/testmips.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testmips;

	// Inputs
	reg clk;
	reg reset; 

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#10 reset = 0;
		// Wait 100 ns for global reset to finish
		
        
		// Add stimulus here

	end
	
	always #1 clk = ~clk;
      
endmodule


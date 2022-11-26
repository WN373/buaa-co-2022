`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:27:08 11/22/2022
// Design Name:   mips
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P5/ref/mips_tb_r.v
// Project Name:  ref
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

module mips_tb_r;

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


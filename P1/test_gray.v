`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:07:53 10/06/2022
// Design Name:   gray
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P1/test_gray.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gray
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_gray;

	// Inputs
	reg Clk;
	reg Reset;
	reg En;

	// Outputs
	wire [2:0] Output;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	gray uut (
		.Clk(Clk), 
		.Reset(Reset), 
		.En(En), 
		.Output(Output), 
		.Overflow(Overflow)
	);

	initial begin
		// Initialize Inputs
		Clk = 0;
		Reset = 1;
		En = 0;

		// Wait 100 ns for global reset to finish
		#10;
		// Add stimulus here
      Reset = 0;
		#2
		En = 1;
		#2 
		En = 0;
		#2 
		En = 1;
		#40
		Reset = 1;

	end
	
	always #1 Clk = ~Clk;
      
endmodule


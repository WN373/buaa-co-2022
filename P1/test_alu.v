`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:28:26 10/06/2022
// Design Name:   alu
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P1/test_alu.v
// Project Name:  P1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_alu;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALUOp;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.ALUOp(ALUOp), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 32'hf0000000;
		B = 3;
		ALUOp = 3'b101;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
       
endmodule


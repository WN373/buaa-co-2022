`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:14:47 11/04/2022
// Design Name:   IFU
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P4/Project/testIFU.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IFU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testIFU;

	// Inputs
	reg clk;
	reg reset;
	reg [2:0] nPC_sel;
	reg [31:0] imm32;
	reg [31:0] PC_jr;
	reg [31:0] PC_j;

	// Outputs
	wire [31:0] PCa4;
	wire [31:0] instr;

	// Instantiate the Unit Under Test (UUT)
	IFU uut (
		.clk(clk), 
		.reset(reset), 
		.nPC_sel(nPC_sel), 
		.imm32(imm32), 
		.PC_jr(PC_jr), 
		.PC_j(PC_j), 
		.PCa4(PCa4), 
		.instr(instr)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		nPC_sel = 0;
		imm32 = 0;
		PC_jr = 0;
		PC_j = 0;

		// Wait 100 ns for global reset to finish
		#100; 
        
		// Add stimulus here

	end
      
endmodule


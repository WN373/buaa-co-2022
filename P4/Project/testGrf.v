`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:46:58 11/02/2022
// Design Name:   GRF
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P4/Project/testGrf.v
// Project Name:  P4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: GRF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testGrf;

	// Inputs
	reg clk;
	reg reset;
	reg reg_write;
	reg [4:0] grf_adr_1;
	reg [4:0] grf_adr_2;
	reg [4:0] grf_adr_3;
	reg [31:0] grf_write;

	// Outputs
	wire [31:0] grf_read1;
	wire [31:0] grf_read2;

	// Instantiate the Unit Under Test (UUT)
	GRF uut (
		.clk(clk), 
		.reset(reset), 
		.reg_write(reg_write), 
		.grf_adr_1(grf_adr_1), 
		.grf_adr_2(grf_adr_2), 
		.grf_adr_3(grf_adr_3), 
		.grf_write(grf_write), 
		.grf_read1(grf_read1), 
		.grf_read2(grf_read2)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		reg_write = 0;
		grf_adr_1 = 0;
		grf_adr_2 = 0;
		grf_adr_3 = 0;
		grf_write = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


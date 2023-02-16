`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:01:12 11/23/2022
// Design Name:   mips
// Module Name:   D:/MyFileAtD/CO2022/buaa-co-2022/P6/P6extends/P6Project/mips_tb6.v
// Project Name:  P6Project
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

module mips_tb6;

	// Inputs
	reg clk;
	reg reset;
	wire [31:0] i_inst_rdata;
	reg [31:0] m_data_rdata;

	// Outputs
	wire [31:0] i_inst_addr;
	wire [31:0] m_data_addr;
	wire [31:0] m_data_wdata;
	wire [3:0] m_data_byteen;
	wire [31:0] m_inst_addr;
	wire w_grf_we;
	wire [4:0] w_grf_addr;
	wire [31:0] w_grf_wdata;
	wire [31:0] w_inst_addr;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset), 
		.i_inst_rdata(i_inst_rdata), 
		.m_data_rdata(m_data_rdata), 
		.i_inst_addr(i_inst_addr), 
		.m_data_addr(m_data_addr), 
		.m_data_wdata(m_data_wdata), 
		.m_data_byteen(m_data_byteen), 
		.m_inst_addr(m_inst_addr), 
		.w_grf_we(w_grf_we), 
		.w_grf_addr(w_grf_addr), 
		.w_grf_wdata(w_grf_wdata), 
		.w_inst_addr(w_inst_addr)
	);

	IM uim (
		.pc(i_inst_addr),
		.instr(i_inst_rdata)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		// i_inst_rdata = 0;
		m_data_rdata = 0;
		#20 reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end

	always #1 clk = ~clk;
      
endmodule


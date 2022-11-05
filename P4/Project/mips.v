`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:16 11/02/2022 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );

    wire [31:0] instr;
    wire [5:0] optCode = instr[31:26];
    wire [4:0] rs = instr[25:21];
    wire [4:0] rt = instr[20:16]; 
    wire [4:0] rd = instr[15:11];
    wire [4:0] shamt = instr[10:6];
    wire [5:0] funcCode = instr[5:0];
    wire [15:0] imm16 = instr[15:0];
    wire [25:0] instr_index = instr[25:0];

    wire [31:0] PCa4;
    wire [31:0] PC;
	 wire [31:0] imm32;
	 
    wire [3:0] alu_op;
    wire [2:0] ext_op, nPC_sel, alu_src, 
                regw_dst, regw_src, width;
    wire reg_write_enable, mem_write_enable, cmp;

    wire nop = (instr == 0) ? 1 : 0;

    Controller uCtrl(
        // input
        .optCode(optCode),
        .funcCode(funcCode),
        // output
        .alu_op(alu_op),
        .ext_op(ext_op),
		  .alu_src(alu_src),
        .nPC_sel(nPC_sel),
        .reg_write_enable(reg_write_enable),
        .mem_write_enable(mem_write_enable),
        .regw_dst(regw_dst),
        .regw_src(regw_src),
        .width(width) 
    );

    EXT uext(
        // input
        .imm16(imm16),
        .ext_op(ext_op),
        // output
        .imm32(imm32)
    );

    // ignoring MUX here...
    wire [4:0] grf_adr_1 = rs;
    wire [4:0] grf_adr_2 = rt;
    wire [4:0] grf_adr_3 = (regw_dst == 0) ? rt : 
                            (regw_dst == 1) ? rd : 5'h1f ;
    wire [31:0] grf_write = (regw_src == 0) ? alu_res : 
                            (regw_src == 1) ? mem_read :
                            (regw_src == 2) ? imm32 :
                            (regw_src == 3) ? PCa4 : 0;
    wire [31:0] grf_read1, grf_read2; 
 
    GRF ugrf(
        // input
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .reg_write_enable(reg_write_enable ^ nop),
        .grf_adr_1(grf_adr_1),
        .grf_adr_2(grf_adr_2),
        .grf_adr_3(grf_adr_3),
        .grf_write(grf_write),
        // output
        .grf_read1(grf_read1),
        .grf_read2(grf_read2)
    );

    wire [31:0] A1 = grf_read1;
    wire [31:0] A2 = (alu_src == 0) ? grf_read2 :
                    (alu_src == 1) ? imm32 : 0;
    wire [31:0] alu_res, mem_read;

    ALU ualu(
        // input
        .alu_op(alu_op),
        .A1(A1),
        .A2(A2),
        // output
        .int_res(alu_res),
        .bool_res(cmp)
    );

    DM udm(
        .clk(clk),
        .reset(reset),
        .mem_write_enable(mem_write_enable),
        .width(width),
        .mem_addr(alu_res),
        .mem_write(grf_read2),
        .PC(PC),
        // output
        .mem_read(mem_read)
    );

    IFU uifu(
        // input
        .clk(clk),
        .reset(reset),
        .cmp(cmp),
        .nPC_sel(nPC_sel),
        .imm32(imm32),
        .PC_jr(grf_read1),
        .PC_j(instr_index),
        // output
        .PCa4(PCa4),
        .instr(instr),
        .PC(PC)
    );

    

    


endmodule
 
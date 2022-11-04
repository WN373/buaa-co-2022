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

    wire instr;
    wire [5:0] optCode = instr[31:26];
    wire [4:0] rs = instr[25:21];
    wire [4:0] rt = instr[20:16];
    wire [4:0] rd = instr[15:11];
    wire [4:0] shamt = instr[10:6];
    wire [5:0] funcCode = instr[5:0];
    wire [15:0] imm16 = instr[15:0];
    wire [25:0] instr_index = instr[25:0];

    wire PCa4;

    IFU u0(
        .clk(clk),
        .reset(reset),
        .instr(instr),
        .PCa4(PCa4),
        
    );

    

    


endmodule
 
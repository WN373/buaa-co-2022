`timescale 1ns/1ps

module mips (
    input clk,
    input reset
);
    // Fetch Phase
    wire [31:0] F_ins, F_PC;

    Fetch uftc(
        // input
        .clk(clk), .reset(reset),
        .pause(0),
        .branch(D_branch),
        .DnPC(DnPC),
        // output
        .F_ins(F_ins),
        .F_PC(F_PC)
    ); 

    // =========== F2D register ==========
    IF2ID uf2d(
        // input
        .reset(reset), .clk(clk), .pause(D_branch),
        .F_ins(F_ins),
        .F_PC(F_PC),
        // output
        .D_ins(D_ins),
        .D_PC(D_PC)
    );
    // =========== F2D end ==========

    // Decode Phase
    wire [31:0] DnPC, D_ins, D_PC, D_reg_rs, D_reg_rt;
    wire D_branch;

    Decode udec(
        // input
        .clk(clk), .reset(reset),
        .D_ins(D_ins),
        .D_PC(D_PC),
        .reg_read1(reg_read1),
        .reg_read2(reg_read2),
        // output
        .PCw_enable(D_branch),
        .DnPC(DnPC),
        .reg_rs(D_reg_rs),
        .reg_rt(D_reg_rt)
    ); 

    // GRF
    wire [31:0] reg_read1, reg_read2;
    wire [4:0] reg_adr1, reg_adr2, reg_adr3;

    GRF ugrf(
        // input 
        .reset(reset),
        .clk(clk),
        .reg_we(),
        .reg_adr1(),
        .reg_adr2(),
        .reg_adr3(),
        .reg_wd(),
        .WPC(W_PC)
        // output
        .reg_rd1(reg_read1),
        .reg_rd2(reg_read2)
    );








    
endmodule
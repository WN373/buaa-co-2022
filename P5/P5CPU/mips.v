`timescale 1ns/1ps

module mips (
    input clk,
    input reset
);
    // wire delaration
    // Fetch Phase
    wire [31:0] F_ins, F_PC;

    // Decode Phase
    wire [31:0] DnPC, D_ins, D_PC, D_reg_rs, D_reg_rt, D_imm32;
    wire [4:0] D_reg_adr1, D_reg_adr2;
    wire D_branch, D_lat;

    // GRF
    wire [31:0] reg_read1, reg_read2;
    wire [4:0] reg_adr1 = D_reg_adr1, 
                reg_adr2 = D_reg_adr2; 
    wire [4:0] reg_adr3;

    // Execute
    wire [31:0] E_imm32, E_reg_rs, E_reg_rt, E_PC, E_ins;
    wire E_lat;
    wire [31:0] E_alu_res;
    wire [4:0] ET, E_regw_adr;
    wire [31:0] E_reg_write;

    // Memory
    wire [31:0] M_ins, M_PC, M_alu_res, M_reg_rs, M_reg_rt, M_imm32;
    wire M_lat;
    wire [31:0] M_mem_read;
    wire [4:0] M_regw_adr;
    wire [31:0] M_reg_write;

    // DM
    wire memw_enable;
    wire [31:0] mem_adr, mem_write;

    // Writeback
    wire [31:0] W_ins, W_PC, W_alu_res, W_reg_rs, W_reg_rt, W_mem_read, W_reg_write;
    wire W_regw_enable, W_lat;
    // wire [4:0] W_reg_adr;

    // hazard
    wire Pause_before_E;
    wire [31:0] D_rs_m, D_rt_m, E_rs_m, E_rt_m, M_rt_m;


    // Fetch Phase
    // wire [31:0] F_ins, F_PC;

    Fetch uftc(
        // input
        .clk(clk), .reset(reset),
        .pause(Pause_before_E),
        .branch(D_branch),      
        .DnPC(DnPC),
        // output
        .F_ins(F_ins),
        .F_PC(F_PC)
    ); 

    // =========== F2D register ==========
    IF2ID uf2d(
        // input
        .reset(reset), .clk(clk), .pause(Pause_before_E),
        .F_ins(F_ins),
        .F_PC(F_PC),
        .F_lat(1'b0),
        // output
        .D_ins(D_ins),
        .D_PC(D_PC),
        .D_lat(D_lat)
    );
    // =========== F2D end ==========

    // Decode Phase
    // wire [31:0] DnPC, D_ins, D_PC, D_reg_rs, D_reg_rt, D_imm32;
    // wire [4:0] D_reg_adr1, D_reg_adr2;
    // wire D_branch, D_lat;

    Decode udec(
        // input
        .clk(clk), .reset(reset),
        .D_ins(D_ins),
        .D_PC(D_PC),
        .reg_read1(D_rs_m),
        .reg_read2(D_rt_m),
        // output
        .PCw_enable(D_branch),      // Clear == 
        .DnPC(DnPC),
        .reg_rs(D_reg_rs),
        .reg_rt(D_reg_rt),
        .reg_adr1(D_reg_adr1),
        .reg_adr2(D_reg_adr2),
        .imm32(D_imm32)
    ); 

    // GRF
    // wire [31:0] reg_read1, reg_read2;
    // wire [4:0] reg_adr1 = D_reg_adr1, 
    //             reg_adr2 = D_reg_adr2; 
    // wire [4:0] reg_adr3;

    GRF ugrf(
        // input 
        .reset(reset),
        .clk(clk),
        .pause(1'b0),
        .reg_we(W_regw_enable&&(!W_lat)),
        .reg_adr1(reg_adr1),
        .reg_adr2(reg_adr2),
        .reg_adr3(reg_adr3),
        .reg_wd(W_reg_write),
        .WPC(W_PC),
        // output
        .reg_rd1(reg_read1),
        .reg_rd2(reg_read2)
    );

    // ========== D2EX ==========
    ID2EX ud2ex(
        // input
        .clk(clk), .reset(reset || Pause_before_E),
        .pause(1'b0),
        .Dimm32(D_imm32),
        .Dreg_rs(D_reg_rs),
        .Dreg_rt(D_reg_rt),
        .D_PC(D_PC),
        .D_ins(D_ins),
        .D_lat(D_lat),
        // output
        .Eimm32(E_imm32),
        .Ereg_rs(E_reg_rs),
        .Ereg_rt(E_reg_rt),
        .E_ins(E_ins),
        .E_PC(E_PC),
        .E_lat(E_lat)
    );
    // ========== end ==========

    // Execute
    // wire [31:0] E_imm32, E_reg_rs, E_reg_rt, E_PC, E_ins;
    // wire E_lat;
    // wire [31:0] E_alu_res;
    // wire [4:0] ET, E_regw_adr;
    // wire [31:0] E_reg_write;

    Execute uexe(
        .imm32(E_imm32),
        .reg_rs(E_rs_m),
        .reg_rt(E_rt_m),
        .E_PC(E_PC),
        .E_ins(E_ins),
        // output
        .alu_res(E_alu_res),
        .T(ET),
        .regw_adr(E_regw_adr),
        .reg_write(E_reg_write)
    );

    // EX2MEM

    EX2MEM ue2m(
        .reset(reset), .clk(clk),
        .pause(1'b0),
        .E_reg_rs(E_rs_m),
        .E_reg_rt(E_rt_m),
        .E_ins(E_ins),
        .E_PC(E_PC),
        .E_lat(E_lat),
        .E_alu_res(E_alu_res),
        .E_imm32(E_imm32),
        // output
        .M_ins(M_ins),
        .M_PC(M_PC),
        .M_alu_res(M_alu_res),
        .M_reg_rs(M_reg_rs),
        .M_reg_rt(M_reg_rt),
        .M_lat(M_lat),
        .M_imm32(M_imm32)
    );

    // Memory
    // wire [31:0] M_ins, M_PC, M_alu_res, M_reg_rs, M_reg_rt, M_imm32;
    // wire M_lat;
    // wire [31:0] M_mem_read;
    // wire [4:0] M_regw_adr;
    // wire [31:0] M_reg_write;

    Memory umem(
        .reset(reset), .clk(clk),
        .M_ins(M_ins),
        .M_PC(M_PC),
        .alu_res(M_alu_res),
        .reg_rs(M_reg_rs),
        .reg_rt(M_rt_m),
        .imm32(M_imm32),
        .mem_read(M_mem_read),
        // output
        .mem_adr(mem_adr),
        .mem_write(mem_write),
        .memw_enable(memw_enable),
        .regw_adr(M_regw_adr),
        .reg_write(M_reg_write)
    );

    // DM
    // wire memw_enable;
    // wire [31:0] mem_adr, mem_write;

    DM udm(
        .clk(clk), .reset(reset),
        .pause(1'b0),
        .memw_enable(memw_enable && !M_lat),
        .width(3'b0),
        .mem_adr(mem_adr),
        .mem_write(mem_write),
        .MPC(M_PC),
        // output
        .mem_read(M_mem_read)
    );

    // =========== MEM2WB ===========
    MEM2WB um2w(
        .clk(clk), .reset(reset),
        .pause(1'b0),
        .M_ins(M_ins),
        .M_PC(M_PC),
        .M_alu_res(M_alu_res),
        .M_mem_read(M_mem_read),
        .M_reg_rs(M_reg_rs),
        .M_reg_rt(M_rt_m),
        .M_lat(M_lat),
        // output
        .W_ins(W_ins),
        .W_PC(W_PC),
        .W_alu_res(W_alu_res),
        .W_reg_rs(W_reg_rs),
        .W_reg_rt(W_reg_rt),
        .W_mem_read(W_mem_read),
        .W_lat(W_lat)
    );
    // =========== end ===========

    // Writeback
    // wire [31:0] W_ins, W_PC, W_alu_res, W_reg_rs, W_reg_rt, W_mem_read, W_reg_write;
    // wire W_regw_enable, W_lat;
    // wire [4:0] W_reg_adr;

    Writeback uwb(
        .clk(clk), .reset(reset),
        // .pause(1'b0),
        .W_ins(W_ins),
        .W_PC(W_PC),
        .alu_res(W_alu_res),
        .reg_rs(W_reg_rs),
        .reg_rt(W_reg_rt),
        .mem_read(W_mem_read),
        // output
        .reg_write(W_reg_write),
        .regw_adr(reg_adr3),
        .regw_enable(W_regw_enable)
    );
    
    // hazard
    // wire Pause_before_E;
    // wire [31:0] D_rs_m, D_rt_m, E_rs_m, E_rt_m, M_rt_m;

    hazard uhzd(
        // input
        .D_ins(D_ins),
        .E_ins(E_ins),
        .M_ins(M_ins),
        .D_rs_o(reg_read1),
        .D_rt_o(reg_read2),
        .E_rs_o(E_reg_rs),
        .E_rt_o(E_reg_rt),
        .M_rt_o(M_reg_rt),
        .E_ad(E_regw_adr),
        .E_wd(E_reg_write), .ET(ET),
        .M_ad(M_regw_adr),
        .M_wd(M_reg_write),
        .W_ad(W_regw_enable ? reg_adr3 : (5'b0)),
        .W_wd(W_reg_write),        
        // output
        .Pause_before_E(Pause_before_E),
        .D_rs_m(D_rs_m),
        .D_rt_m(D_rt_m),
        .E_rs_m(E_rs_m),
        .E_rt_m(E_rt_m),
        .M_rt_m(M_rt_m)
    );

    
endmodule
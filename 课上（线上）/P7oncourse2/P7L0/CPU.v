`timescale 1ns/1ps
`include "macros.v"

module CPU (
    input clk,
    input reset,
    input [5:0] hw_int,
    output [31:0] macroscopic_pc,

    output [31:0] m_int_addr,
    output [3 :0] m_int_byteen,

    input  [31:0] i_inst_rdata,
    output [31:0] i_inst_addr,

    input  [31:0] m_data_rdata,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3 :0] m_data_byteen,
    output [31:0] m_inst_addr,

    output w_grf_we,

    output [4 :0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr,

    input [31:0] br_rd,
    output [3:0] br_byteen
);
    // wire delaration
    // Fetch Phase
    wire [31:0] F_ins, F_PC;
    assign F_ins = i_inst_rdata;
    assign i_inst_addr = F_PC;
    assign macroscopic_pc = M_PC;
    assign m_int_addr = m_data_addr;
    // assign m_int_byteen =  ? 4'hf : 0;

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
    wire [31:0] E_alu_res, E_mlu_res;
    wire [4:0] E_regw_adr;
    wire [31:0] E_reg_write;

    // Memory
    wire [31:0] M_ins, M_PC, M_alu_res, M_mlu_res, M_reg_rs, M_reg_rt, M_imm32;
    wire M_lat;
    wire [31:0] M_mem_read;
    wire [4:0] M_regw_adr;
    wire [3:0] M_byteen;
    wire [31:0] M_reg_write;
    assign m_inst_addr = M_PC;
    assign m_data_byteen = M_byteen;

    // assign M_mem_read = m_data_rdata;

    // DM
    wire memw_enable;
    wire [31:0] mem_adr, mem_write;
    assign m_data_addr = mem_adr;
    assign m_data_wdata = mem_write;

    // Writeback
    wire [31:0] W_ins, W_PC, W_alu_res, W_mlu_res, W_reg_rs, W_reg_rt, W_mem_read, W_reg_write;
    wire W_regw_enable, W_lat;
    // wire [4:0] W_reg_adr;
    assign w_inst_addr = W_PC;
    assign w_grf_addr = reg_adr3;
    assign w_grf_we = W_regw_enable;
    assign w_grf_wdata = W_reg_write;

    // hazard
    wire stall_h, stall_m, stall;
    wire [31:0] D_rs_m, D_rt_m, E_rs_m, E_rt_m, M_rt_m;
    wire [4:0] ET, MT, WT;

    wire stall_c = eret && ((E_ins[`_opt]==`COP0 && E_ins[`_rs]==`MTC0 && E_ins[`_rd] == 14) 
                    ) ;
    assign stall = stall_h || stall_m || stall_c;

    // P7 Extends
    wire [4:0] F_exccode, D_exccode, E_exccode, M_exccode, cp0_adr, D_eco, E_eco, M_eco;
    wire [31:0] M_cp0_rd, W_cp0_rd, epc_out, DnPC_n;
    wire stall_r;

    // Fetch Phase
    // wire [31:0] F_ins, F_PC;

    Fetch uftc(
        // input
        .clk(clk), .reset(reset),
        .pause(stall && !stall_r),
        .branch(D_branch || eret || stall_r),      
        .DnPC(DnPC_n),
        // // output
        // .F_ins(F_ins),
        .F_PC(F_PC),
        .exc_code(F_exccode)
    ); 

    // =========== F2D register =========
    // assign D_lat = D_branch;
    IF2ID uf2d(
        // input
        .reset(reset || (eret && !stall_c) || stall_r), .clk(clk), .pause(stall),
        .F_ins(F_ins),
        .F_PC(F_PC),
        .F_lat(D_branch),
        .F_exccode(F_exccode),
        // output
        .D_ins(D_ins),
        .D_PC(D_PC),
        .D_lat(D_lat),
        .D_exccode(D_exccode)
    );
    // =========== F2D end ==========

    // Decode Phase
    // wire [31:0] DnPC, D_ins, D_PC, D_reg_rs, D_reg_rt, D_imm32;
    // wire [4:0] D_reg_adr1, D_reg_adr2;
    // wire D_branch, D_lat;
    wire D_mlu_use;
    assign DnPC_n = stall_r ? 32'h4180 : eret ? epc_out : DnPC;

    Decode udec(
        // input
        .clk(clk), .reset(reset),
        .D_ins(D_exccode==0 ? D_ins : 32'b0),
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
        .imm32(D_imm32),
        .mlu_use(D_mlu_use),
        .eret(eret),
        .exc_code(D_eco)
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
        .reg_we(W_regw_enable),
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
        .clk(clk), .reset(reset || stall || stall_r),
        .pause(1'b0),
        .Dimm32(D_imm32),
        .Dreg_rs(D_reg_rs),
        .Dreg_rt(D_reg_rt),
        .D_PC(D_PC),
        .D_ins(D_ins),
        .D_lat(D_lat),
        .D_exccode((D_exccode == 0) ? D_eco : D_exccode),
        // output
        .Eimm32(E_imm32),
        .Ereg_rs(E_reg_rs),
        .Ereg_rt(E_reg_rt),
        .E_ins(E_ins),
        .E_PC(E_PC),
        .E_lat(E_lat),
        .E_exccode(E_exccode)
    );
    // ========== end ==========

    // Execute
    // wire [31:0] E_imm32, E_reg_rs, E_reg_rt, E_PC, E_ins;
    // wire E_lat;
    // wire [31:0] E_alu_res;
    // wire [4:0] ET, E_regw_adr;
    // wire [31:0] E_reg_write;

    Execute uexe(
        .clk(clk), .reset(reset),
        .pause(stall_r),
        .imm32(E_imm32),
        .reg_rs(E_rs_m),
        .reg_rt(E_rt_m),
        .E_PC(E_PC),
        .E_ins(E_exccode==0 ? E_ins : 32'b0),
        // output
        .alu_res(E_alu_res),
        .mlu_res(E_mlu_res),
        .T(ET),
        .regw_adr(E_regw_adr),
        .reg_write(E_reg_write),
        .busy(busy),
        .exc_code(E_eco)
    );

    assign stall_m = busy && D_mlu_use;

    // EX2MEM

    EX2MEM ue2m(
        .reset(reset || stall_r), .clk(clk),
        .pause(1'b0),
        .E_reg_rs(E_rs_m),
        .E_reg_rt(E_rt_m),
        .E_ins(E_ins),
        .E_PC(E_PC),
        .E_lat(E_lat),
        .E_alu_res(E_alu_res),
        .E_mlu_res(E_mlu_res),
        .E_imm32(E_imm32),
        .E_exccode(E_exccode==0 ? E_eco : E_exccode),
        // output
        .M_ins(M_ins),
        .M_PC(M_PC),
        .M_alu_res(M_alu_res),
        .M_mlu_res(M_mlu_res),
        .M_reg_rs(M_reg_rs),
        .M_reg_rt(M_reg_rt),
        .M_lat(M_lat),
        .M_imm32(M_imm32),
        .M_exccode(M_exccode)
    );

    // Memory
    // wire [31:0] M_ins, M_PC, M_alu_res, M_reg_rs, M_reg_rt, M_imm32;
    // wire M_lat;
    // wire [31:0] M_mem_read;
    // wire [4:0] M_regw_adr;
    // wire [31:0] M_reg_write;

    Memory umem(
        .reset(reset || stall_r), .clk(clk),
        .M_ins(M_exccode==0 ? M_ins : 32'b0),
        .M_PC(M_PC),
        .alu_res(M_alu_res),
        .mlu_res(M_mlu_res),
        .reg_rs(M_reg_rs),
        .reg_rt(M_rt_m),
        .imm32(M_imm32),
        .mem_read_raw(m_data_rdata),
        .br_rd(br_rd),
        .req(stall_r),
        // output
        .mem_read(M_mem_read),
        .mem_adr(mem_adr),
        .mem_write(mem_write),
        .byt_dm(M_byteen),
        .byt_i(m_int_byteen),
        .byt_dv(br_byteen),
        .memw_enable(memw_enable),
        .regw_adr(M_regw_adr),
        .reg_write(M_reg_write),
        .T(MT),
        .cp0_adr(cp0_adr),
        .cp0_we(cp0_we),
        .exc_code(M_eco),
        .eret(M_eret)
    );

    CP0 ucp0(
        // input
        .clk(clk), .reset(reset),
        .bd_in(M_lat),
        .cp0_adr(cp0_adr),
        .exl_clr(M_eret),
        .exc_code(M_exccode==0 ? M_eco : M_exccode),
        .cp0_wd(M_rt_m),
        .en(cp0_we),
        .vpc(M_PC),
        .hw_int(hw_int),
        // output
        .cp0_rd(M_cp0_rd),
        .epc_out(epc_out),
        .req(stall_r)
    );

    // DM
    // wire memw_enable;
    // wire [31:0] mem_adr, mem_write;

    // DM udm(
    //     .clk(clk), .reset(reset),
    //     .pause(1'b0),
    //     .memw_enable(memw_enable && !M_lat),
    //     .byteen(M_byteen),
    //     .mem_adr(mem_adr),
    //     .mem_write(mem_write),
    //     .MPC(M_PC),
    //     // output
    //     .mem_read(M_mem_read)
    // );

    // =========== MEM2WB ===========
    MEM2WB um2w(
        .clk(clk), .reset(reset || stall_r),
        .pause(1'b0),
        .M_ins(M_ins),
        .M_PC(M_PC),
        .M_alu_res(M_alu_res),
        .M_mlu_res(M_mlu_res),
        .M_mem_read(M_mem_read),
        .M_reg_rs(M_reg_rs),
        .M_reg_rt(M_rt_m),
        .M_lat(M_lat),
        .M_cp0_rd(M_cp0_rd),
        // output
        .W_ins(W_ins),
        .W_PC(W_PC),
        .W_alu_res(W_alu_res),
        .W_mlu_res(W_mlu_res),
        .W_reg_rs(W_reg_rs),
        .W_reg_rt(W_reg_rt),
        .W_mem_read(W_mem_read),
        .W_lat(W_lat),
        .W_cp0_rd(W_cp0_rd)
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
        .mlu_res(W_mlu_res),
        .reg_rs(W_reg_rs),
        .reg_rt(W_reg_rt),
        .mem_read(W_mem_read),
        .cp0_rd(W_cp0_rd),
        // output
        .reg_write(W_reg_write),
        .regw_adr(reg_adr3),
        .regw_enable(W_regw_enable),
        .T(WT)
    );
    
    // hazard
    // wire stall;
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
        .M_wd(M_reg_write), .MT(MT),
        .W_ad(reg_adr3),
        .W_wd(W_reg_write), .WT(WT),
        // output
        .Pause_before_E(stall_h),
        .D_rs_m(D_rs_m),
        .D_rt_m(D_rt_m),
        .E_rs_m(E_rs_m),
        .E_rt_m(E_rt_m),
        .M_rt_m(M_rt_m)
    );

    
endmodule
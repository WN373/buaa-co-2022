`include "macros.v"

module Decode(
    input clk, reset, 
    input [31:0] D_ins, D_PC,
    input [31:0] reg_read1, reg_read2,
    output [4:0] reg_adr1, reg_adr2,
    output PCw_enable,
    output [31:0] DnPC, imm32,
    output [31:0] reg_rs, reg_rt
);
    wire [4:0] rs = D_ins[`_rs]
            , rt = D_ins[`_rt];
    wire [15:0] imm16 = D_ins[`_imm16];
    wire [25:0] imm26 = D_ins[`_imm26];
    // wire [31:0] imm32;

    assign reg_adr1 = rs;
    assign reg_adr2 = rt;
    assign reg_rs = reg_read1;
    assign reg_rt = reg_read2;

    wire [2:0] nPC_sel, brc_op, ext_op;
    wire bool_res, branch;

    assign PCw_enable = bool_res && branch; 

    CU ucud (
        .instr(D_ins),
        // output
        .nPC_sel(nPC_sel),
        .brc_op(brc_op),
        .ext_op(ext_op),
        .branch(branch)
    );

    EXT uext (
        // input
        .ext_op(ext_op),
        .imm16(imm16),
        .grt(reg_read2),
        // output
        .imm32(imm32)
    );

    NPC unpcd (
        //inp
        .nPC_sel(nPC_sel),
        .pc(D_PC),
        .imm32(imm32),
        .reg_ra(reg_read1),
        .imm26(imm26),
        // output
        .npc(DnPC)
    );

    CMP ucmp(
        // inp
        .A1(reg_read1),
        .A2(reg_read2),
        .brc_op(brc_op),
        // outp
        .bool_res(bool_res)
    );


endmodule
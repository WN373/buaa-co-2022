`include "macros.v"

module Writeback(
    input clk, reset, lcond,
    input [31:0] W_PC, W_ins, alu_res, reg_rs, reg_rt, mem_read,
    output [31:0]  reg_write,
    output [4:0] regw_adr, T,
    output regw_enable
);
    wire [4:0] rs = W_ins[`_rs], 
                rt = W_ins[`_rt],
                rd = W_ins[`_rd],
                shamt = W_ins[`_shamt];
    wire [15:0] imm16 = W_ins[`_imm16];
    wire [3:0] regw_src, regw_dst;
    wire [31:0] imm32;
    wire [2:0] ext_op;

    EXT uextw(
        .ext_op(ext_op),
        .imm16(imm16),
        // output
        .imm32(imm32)
    );

    CU ucuw (
        .instr(W_ins),
        // output
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .ext_op(ext_op),
        .T(T),
        .lhogez(lhogez)
    );

    assign reg_write =  (regw_src == 0) ? alu_res : 
                        (regw_src == 1) ? mem_read :
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? W_PC+8 : 
                        lhogez ? (lcond ? mem_read : W_PC + 4) :
                        0 ;

    assign regw_adr =   (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt : 
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f :
                        (lhogez) ? (lcond ? rt : 5'h1f) :
                        0;

    

endmodule
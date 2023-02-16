`include "macros.v"
module Memory(
    input reset, clk, 
    input [31:0] M_ins, M_PC, alu_res, reg_rs, reg_rt, imm32, mem_read,
    output [31:0] mem_adr, mem_write,
    output memw_enable,  lhogez,
    output [4:0] regw_adr, T,
    output [31:0] reg_write,
    output [2:0] width
);
    assign mem_adr = alu_res;
    assign mem_write = reg_rt;
    wire [4:0] rt = M_ins[`_rt],
                rs = M_ins[`_rs],
                rd = M_ins[`_rd];
    wire regw_enable;
    wire [3:0] regw_src, regw_dst;
    assign regw_adr = (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt :
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f : 
                        rt;
    assign reg_write = (regw_src == 0) ? alu_res :
                        (regw_src == 1) ? 0:
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? M_PC+8 : 0;

    CU ucum(
        .instr(M_ins),
        // output
        .memw_enable(memw_enable),
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .lhogez(lhogez),
        .width(width),
        .T(T)
    );
    

endmodule
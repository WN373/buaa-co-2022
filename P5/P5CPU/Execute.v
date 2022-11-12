`include "macros.v"

module Execute(
    input [31:0] imm32, reg_rs, reg_rt, E_PC, E_ins,
    output [31:0] alu_res,
    output [31:0] reg_write,
    output [4:0] regw_adr, T
);
    wire [4:0] rs = E_ins[`_rs]
            , rt = E_ins[`_rt]
            , rd = E_ins[`_rd]
            , shamt = E_ins[`_shamt];
    wire [2:0] alu_op, alu_src, alu_src0;
    wire regw_enable;
    wire [3:0] regw_src, regw_dst;
    assign regw_adr = (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt :
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f : 
                        0;
    assign reg_write = (regw_src == 0) ? alu_res :
                        (regw_src == 1) ? 0 :
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? E_PC+8 : 0;

    CU ucue(
        .instr(E_ins),
        // output
        .alu_op(alu_op),
        .alu_src(alu_src),
        .alu_src0(alu_src0),
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .T(T)
    );

    
    wire [31:0] A1 = (alu_src0 == 0) ? reg_rs :
                    (alu_src0 == 1) ? {27'b0 ,shamt} : 0,
                A2 = (alu_src == 0) ? reg_rt : 
                    (alu_src == 1) ? imm32 : 
                    0;
    
    ALU ualu(
        .A1(A1),
        .A2(A2),
        .alu_op(alu_op),
        // output
        .alu_res(alu_res)
    );


endmodule
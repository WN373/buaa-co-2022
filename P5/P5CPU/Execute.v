`include "macros.v"

module Execute(
    input [31:0] imm32, reg_rs, reg_rt, E_PC, E_ins,
    output [31:0] alu_res
);
    wire [4:0] rs = E_ins[_rs]
            , rt = E_ins[_rt]
            , shamt = E_ins[_shamt];
    wire [2:0] alu_op, alu_src, alu_src0;

    CU ucue(
        .instr(E_ins),
        // output
        .alu_op(alu_op),
        .alu_src(alu_src),
        .alusrc0(alu_src0)
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
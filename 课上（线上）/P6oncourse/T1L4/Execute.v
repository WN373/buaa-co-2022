`include "macros.v"

module Execute(
    input clk, reset,
    input [31:0] imm32, reg_rs, reg_rt, E_PC, E_ins,
    output [31:0] alu_res, mlu_res,
    output [31:0] reg_write, 
    output [4:0] regw_adr, T,
    output busy
);
    wire jap;
    wire [31:0] HI, LO;
    wire [4:0] rs = E_ins[`_rs]
            , rt = jap ? 5'd29 : E_ins[`_rt]
            , rd = E_ins[`_rd]
            , shamt = E_ins[`_shamt];
    wire [2:0] alu_src, alu_src0, mlu_out;
    wire [4:0] alu_op, mlu_op;
    wire regw_enable, mlu_start, busy_0;
    wire [3:0] regw_src, regw_dst;
    assign regw_adr = (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt :
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f : 
                        (regw_dst == 3) ? 5'd29 :
                        0;
    assign reg_write = (regw_src == 0) ? 0 :
                        (regw_src == 1) ? 0 :
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? E_PC+8 : 
                        (regw_src == 4) ? 0 :
                        (regw_src == 5) ? reg_rt - 4 :
                        0;
    assign mlu_res = (mlu_out == 1) ? HI :
                     (mlu_out == 2) ? LO :
                     0;
    assign busy = busy_0 || mlu_start;

    CU ucue(
        .instr(E_ins),
        // output
        .alu_op(alu_op),
        .mlu_op(mlu_op),
        .alu_src(alu_src),
        .alu_src0(alu_src0),
        .mlu_out(mlu_out),
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .start(mlu_start),
        .T(T), .jap(jap)
    );

    
    wire [31:0] A1 = (alu_src0 == 0) ? reg_rs :
                    (alu_src0 == 1) ? {27'b0 ,shamt} : 
                    0,
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

    MLU umlu(
        .clk(clk),
        .reset(reset),
        .D1(A1),
        .D2(A2),
        .mlu_op(mlu_op),
        .start(mlu_start),
        // output
        .HI(HI),
        .LO(LO),
        .busy(busy_0)
    );


endmodule
`include "macros.v"

module CU(
    input [31:0] instr,
    // Decode
    output [2:0] nPC_sel,  ext_op,
    output branch,
    output [5:0]brc_op,

    // Execute
    output [2:0] alu_src0, alu_src, mlu_out,
    output [4:0] mlu_op, alu_op,
    output start, mlu_use,

    // Memory
    output memw_enable, sign_ext,
    output [2:0] width,

    // Writeback
    output regw_enable,
    output [3:0] regw_src, regw_dst,

    // global
    output [4:0] T, reg_adr, rsT, rtT

);

    wire [5:0] opt = instr[`_opt]
            , func = instr[`_funct];

    wire R = (opt == 0) ? 1 : 0;
    wire cal_r = add || sub || And || Or || Xor || Nor || cal_s || cal_sv || slt || sltu ;
        wire add = (R && (func == `ADD || func == `ADDU)) ? 1 : 0;
        wire sub = (R && (func == `SUB || func == `SUBU)) ? 1 : 0;
        wire And = (R && func == `AND) ? 1 : 0;
        wire Or  = (R && func == `OR ) ? 1 : 0;
        wire Xor = (R && func == `XOR);
        wire Nor = (R && func == `NOR);
        wire cal_s = sll || srl || sra;
            wire sll = (R && func == `SLL) ? 1 : 0;
            wire srl = (R && func == `SRL);
            wire sra = (R && func == `SRA);
        wire cal_sv = sllv || srlv || srav;
            wire sllv = (R && func == `SLLV);
            wire srlv = (R && func == `SRLV);
            wire srav = (R && func == `SRAV);
        wire slt = R && func == `SLT;   
        wire sltu = R && func == `SLTU;
    wire lui = (opt == `LUI) ? 1 : 0;

    wire cal_i = addi || Andi || ori || Xori || slti || sltiu ;
        wire addi = (opt == `ADDI || opt == `ADDIU);
        wire Andi = opt == `ANDI ;
        wire ori = (opt == `ORI) ? 1 : 0;
        wire Xori = opt == `XORI;
        wire slti = opt == `SLTI;
        wire sltiu = opt == `SLTIU;

    wire load = lb || lh || lw;
        wire lb = opt == `LB;
        wire lh = opt == `LH;
        wire lw = (opt == `LW) ? 1 : 0;
    wire save = sb || sh || sw;
        wire sb = opt == `SB;
        wire sh = opt == `SH;
        wire sw = (opt == `SW) ? 1 : 0;

    wire b_ins = beq || bne || blez || bgtz || bltz || bgez;
        wire beq = (opt == `BEQ) ? 1 : 0;
        wire bne = opt == `BNE;
        wire blez = opt == `BLEZ;
        wire bgez = (opt == `BGEZ && instr[`_rt] == 5'b1);
        wire bltz = (opt == `BLTZ && instr[`_rt] == 5'b0);
        wire bgtz = opt == `BGTZ;
    
    wire j_ins = j || jal || jalr || jr;
        wire j_l = jal || jalr;
        wire j_r = jr  || jalr;
            wire j = (opt == `J) ? 1 : 0;
            wire jal = (opt == `JAL) ? 1 : 0;
            wire jr = (R && func == `JR) ? 1 : 0;
            wire jalr = (R && func == `JALR);

    wire cal_mt = mult || multu || div || divu || mthi || mtlo || fdiv;
        wire mult = (R && func == `MULT);
        wire multu =(R && func == `MULTU);
        wire div =  (R && func == `DIV);
        wire divu = (R && func == `DIVU);
        wire mthi = (R && func == `MTHI);
        wire mtlo = (R && func == `MTLO);
        wire fdiv = (R && func == 6'b101100);
    wire cal_mf = mfhi || mflo;
        wire mfhi = (R && func == `MFHI);
        wire mflo = (R && func == `MFLO);
    wire cal_m = cal_mt || cal_mf;
    

    // Decode
    assign nPC_sel = b_ins ? 1 :
                    j_r ? 2 :
                    j || jal ? 3 :
                    0;
    /*  0: pc+4
        1: pc+4+imm32
        2: jr
        3: j, jal
    */
    assign brc_op = beq ? 5'd1 :
                    bne ? 5'd2 :
                    bgez ? 5'd3 :
                    blez ? 5'd4 :
                    bgtz ? 5'd5 :
                    bltz ? 5'd6 :
                    j_ins ? 0 : 
                    7;
    /*  (brc_op == 0) ? 1 :
        (brc_op == 1) ? (A1 == A2) :
        (brc_op == 2) ? (A1 != A2) :
        (brc_op == 3) ? ($signed(A1) >= 0) :
        (brc_op == 4) ? ($signed(A1) <= 0) :
        (brc_op == 5) ? ($signed(A1) > 0) :
        (brc_op == 6) ? ($signed(A1) < 0) :
    */
    assign ext_op = (load || save || b_ins || addi || slti || sltiu) ? 1 :
                    (lui) ? 2 :
                    0;
    /*0: unsigned; 1:signed; 2:tohigh */
    assign branch = j_ins || b_ins;

    // Execute
    assign start = cal_mt;
    assign mlu_use = cal_mf || mthi || mtlo;
    assign mlu_op = mult ? `MLU_mult  :
                    multu? `MLU_multu :
                    div  ? `MLU_div   :
                    divu ? `MLU_divu  : 
                    mthi ? `MLU_mthi  :
                    mtlo ? `MLU_mtlo  :
                    fdiv ? `MLU_fdiv  :
                    0;
    assign alu_op = add || load || save || addi ?   `ALU_add :
                    sub ?                           `ALU_sub :
                    ori || Or ?                     `ALU_or :
                    sll || sllv ?                   `ALU_sll :
                    Andi || And ?                   `ALU_and :
                    slt || slti ?                   `ALU_slt :
                    sltu  || sltiu ?                `ALU_sltu :
                    Xor || Xori ?                   `ALU_xor :
                    Nor ?                           `ALU_nor :
                    srl || srlv ?                   `ALU_srl :
                    sra || srav ?                   `ALU_sra :
                    0;
    assign alu_src0 = {2'b0, cal_s};
    assign alu_src = {2'b0, cal_i || load || save};
    /* 
    0 : rt
    1 : imm32
    */
    assign mlu_out = mfhi ? 1 :
                    mflo ? 2 :
                    0;

    
    // Memory
    assign memw_enable = save;
    assign width = (sw || lw) ? 1 :
                    (sh || lh) ? 2 :
                    (sb || lb) ? 3 : 0;
    assign sign_ext = 1;

    // Writeback
    assign regw_enable = load || lui || cal_i || cal_r || j_l || cal_mf;
    assign regw_src =   cal_i || cal_r ? 0 :
                        load ? 1 :
                        lui ? 2 :
                        j_l ? 3 :
                        cal_mf ? 4 :
                        0;
    /*
        0 : alu_res
        1 : mem_read
        2 : imm32(tohi)
        3 : PC+4
        4 : mlu_res
    */
    assign regw_dst =   cal_i || lui || load ? 0 :
                        cal_r || cal_mf || jalr? 1 :
                        jal ? 2 : 
                        0;
    /*
    0 : rt;
    1 : rd;
    2 : 31
    */

    // global
    assign T = (b_ins || j_l || lui) ? 0 :
                (cal_r || cal_i || cal_mf) ? 1 :
                (load) ? 2 :
                0;
    /*
    0 from D : beq, jal, lui,
    1 from E : add, sub, sll, ori, 
    2 from M : lw 
    other : nowrite
    */
    assign rsT = (b_ins || j_r) ? 0 :
                (load || save || cal_r || cal_i || cal_mt) ? 1:
                7;
    /*
    0 : beq, jr
    1 : lw, sw, R, i， mt
    other : 7
    */
    assign rtT = (b_ins) ? 0 :
                (cal_r || cal_mt) ? 1 :
                (save) ? 2 :
                7;
    /*
    0 : beq
    1 : R, mt
    2 : sw
    other : 7
    */


endmodule
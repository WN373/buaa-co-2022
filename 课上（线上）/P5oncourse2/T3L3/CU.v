`include "macros.v"

module CU(
    input [31:0] instr,
    // Decode
    output [2:0] nPC_sel, brc_op, ext_op,
    output branch,

    // Execute
    output [2:0] alu_op, alu_src0, alu_src,

    // Memory
    output memw_enable,

    // Writeback
    output regw_enable,
    output [3:0] regw_src, regw_dst,

    // global
    output [4:0] T, reg_adr, rsT, rtT

);

    wire [5:0] opt = instr[`_opt]
            , func = instr[`_funct];

    wire R = (opt == 0) ? 1 : 0;
    wire add = (R && (func == `ADD || func == `ADDU)) ? 1 : 0;
    wire sub = (R && (func == `SUB || func == `SUBU)) ? 1 : 0;
    wire sll = (R && func == `SLL) ? 1 : 0;
    wire subp = (R && func == 6'b110001) ? 1 : 0;

    wire lui = (opt == `LUI) ? 1 : 0;
    wire ori = (opt == `ORI) ? 1 : 0;

    wire lw = (opt == `LW) ? 1 : 0;
    wire sw = (opt == `SW) ? 1 : 0;

    wire beq = (opt == `BEQ) ? 1 : 0;
    
    wire j = (opt == `J) ? 1 : 0;
    wire jal = (opt == `JAL) ? 1 : 0;
    wire jr = (R && func == `JR) ? 1 : 0;

    // wire cal_r = R;
    // wire cal_i = ori;
    // wire load = lw;
    // wire l_i = lui;
    // wire j_l = jal;
    // wire branch = beq;

    // Decode
    assign nPC_sel = {1'b0, (jr || jal || j) , (j || jal || beq)};
    /*
    0: pc+4
    1: pc+4+imm32
    2: jr           
    3: j, jal
    */
    assign brc_op = {3'b0, j||jal||jr};
    /*
    0: =
    1: true
    */
    assign ext_op = {1'b0, lui, (lw || sw || beq)};
    /*0: unsigned; 1:signed; 2:tohigh */
    assign branch = (j||jal||jr||beq);

    // Execute
    assign alu_op = {subp, sll || ori ,sub || sll};
    /*
    0: +
    1: -
    2: |
    3: <<
    4 : subp
    */
    assign alu_src0 = {2'b0, sll};
    assign alu_src = {2'b0, ori || lw || sw};
    /*
    0 : rt
    1 : imm32
    */
    
    // Memory
    assign memw_enable = sw;

    // Writeback
    assign regw_enable = lw || ori || add || sub || sll || jal || lui || subp;
    assign regw_src = {2'b0, lui || jal, lw || jal};
    /*
    0 : alu_res
    1 : memread
    2 : imm32(tohi)
    3 : PC+4
    */
    assign regw_dst = {2'b0, jal, (add || sll || sub || subp) };
    /*
    0 : rt;
    1 : rd;
    2 : 31
    */

    // global
    assign T = {3'b0, lw , add || sub || sll || ori || subp};
    /*
    0 from D : beq, jal, lui,
    1 from E : add, sub, sll, ori, 
    2 from M : lw 
    other : nowrite
    */
    wire cal_r = R && !jr;
    assign rsT = { !(lw||sw||cal_r||ori||beq||jr),
        3'b0,
        lw || sw || cal_r || ori};
    /*
    0 : beq, jr
    1 : lw, sw, R, i
    other : 16
    */
    assign rtT = { !(beq||sw||cal_r) ,
        2'b0,
        sw,
        cal_r };
    /*
    0 : beq
    1 : R,
    2 : sw
    other : 16
    */


endmodule
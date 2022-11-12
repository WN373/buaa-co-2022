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
    output [4:0] T, reg_adr

);

    wire [5:0] opt = instr[`_opt]
            , func = instr[`_funct];

    wire R = (opt == 0) ? 1 : 0;
    wire add = (R && (func == `ADD || func == `ADDU)) ? 1 : 0;
    wire sub = (R && (func == `SUB || func == `SUBU)) ? 1 : 0;
    wire sll = (R && func == `SLL) ? 1 : 0;

    wire lui = (opt == `LUI) ? 1 : 0;
    wire ori = (opt == `ORI) ? 1 : 0;

    wire lw = (opt == `LW) ? 1 : 0;
    wire sw = (opt == `SW) ? 1 : 0;

    wire beq = (opt == `BEQ) ? 1 : 0;
    
    wire j = (opt == `J) ? 1 : 0;
    wire jal = (opt == `JAL) ? 1 : 0;
    wire jr = (R && func == `JR) ? 1 : 0;

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
    assign alu_op = {1'b0, sll || ori ,sub || sll};
    /*
    0: +
    1: -
    2: |
    3: <<
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
    assign regw_enable = lw || ori || add || sub || sll || jal || lui;
    assign regw_src = {2'b0, lui || jal, lw || jal};
    /*
    0 : alu_res
    1 : memread
    2 : imm32(tohi)
    3 : PC+4
    */
    assign regw_dst = {2'b0, jal, (add || sll || sub) };
    /*
    0 : rt;
    1 : rd;
    2 : 31
    */

    // global
    assign T = {3'b0, lw , add || sub || sll || ori};
    /*
    0 from D : beq, jal, lui,
    1 from E : add, sub, sll, ori, 
    2 from M : lw 
    other : nowrite
    */



endmodule
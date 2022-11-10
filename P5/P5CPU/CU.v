`include "macros.v"

module CU(
    input [31:0] instr,
    // Decode
    output [2:0] nPC_sel, brc_op, ext_op,
    output branch,

    // Execute
    output [2:0] alu_op, alu_src,

    // Memory
    output memw_enable,
    output [2:0] 

    // Writeback
    output regw_enable

);

    wire [5:0] opt = instr[_opt]
            , func = instr[_funct];

    wire R = (opt == 0) ? 1 : 0;
    wire add = (R && func == ADD) ? 1 : 0;
    wire sub = (R && func == SUB) ? 1 : 0;
    wire sll = (R && func == SLL) ? 1 : 0;

    wire lui = (opt == LUI) ? 1 : 0;
    wire ori = (opt == ORI) ? 1 : 0;

    wire lw = (opt == LW) ? 1 : 0;
    wire sw = (opt == SW) ? 1 : 0;

    wire beq = (opt == BEQ) ? 1 : 0;
    
    wire j = (opt == J) ? 1 : 0;
    wire jal = (opt == JAL) ? 1 : 0;
    wire jr = (opt == JR) ? 1 : 0;

    assign nPC_sel = {1'b0, (jr || jal || j) , (j || jal || beq)};
    /*
    0: pc+4
    1: pc+4+imm32
    2: jr           
    3: j, jal
    */
    assign brc_op = 0;
    /*
    0: =
    */
    assign ext_op = {1'b0, lui, (lw || sw || beq)};
    /*0: unsigned; 1:signed; 2:tohigh */
    assign branch = (j||jal||jr||beq);


endmodule
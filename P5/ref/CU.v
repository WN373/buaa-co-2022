module CU (
    input [31:0] instr,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [4:0] shamt,
    output [15:0] imm16,
    output [25:0] imm26,

    output cal_r,
    output cal_i,
    output load,
    output store,
    output branch,
    output jump_i,
    output jump_r,

    output RWE,
    output MWE,
    output [3:0] ALUop,
    output EXTop,
    output [2:0] NPCop,
    output [3:0] CMPop,
    output [2:0] DMRop,
    output [1:0] DMWop,
    output [4:0] RWAsel,
    output [1:0] RWDsel,
    output ALUBsel
);
    wire [5:0] opcode, funct;
    assign opcode = instr[31:26];
    assign funct = instr[5:0];

    assign rs = instr[25:21];
    assign rt = instr[20:16];
    assign rd = instr[15:11];
    assign shamt = instr[10:6];    

    assign imm16 = instr[15:0];
    assign imm26 = instr[25:0];

    wire R;
    assign R = (opcode == 6'b000000);
    
    wire add, sub, And, Or, jr, sll, sllv, slt;
    wire addi, lui, ori, sw, sh, sb, lw, lh, lb;
    wire beq, bne, j, jal;

    assign add = (R && funct == 6'b10_0001);
    assign sub = (R && funct == 6'b10_0011);
    //assign And = (R && funct == 6'b10_0100);
    //assign Or = (R && funct == 6'b10_0101);
    assign jr = (R && funct == 6'b00_1000);
    //assign sll = (R && funct == 6'b00_0000);
    //assign sllv = (R && funct == 6'b00_0100);
    //assign slt = (R && funct == 6'b10_1010);

    //assign addi = (opcode == 6'b00_1000);
    assign lui = (opcode == 6'b00_1111);
    assign ori = (opcode == 6'b00_1101);
    assign sw = (opcode == 6'b10_1011);
    assign sh = (opcode == 6'b10_1001);
    assign sb = (opcode == 6'b10_1000);
    assign lw = (opcode == 6'b10_0011);
    assign lh = (opcode == 6'b10_0001);
    assign lb = (opcode == 6'b10_0000);

    assign beq = (opcode == 6'b00_0100);
    assign bne = (opcode == 6'b00_0101);
    assign j = (opcode == 6'b00_0010);
    assign jal = (opcode == 6'b00_0011);

    assign cal_r = (add || sub);
    assign cal_i = (lui || ori);
    assign load = (lw || lh || lb);
    assign store = (sw || sh || sb);
    assign branch = (beq || bne);
    assign jump_i = (j || jal);
    assign jump_r = (jr);

    //0:not write, 1:write
    assign RWE = (add || sub || lui || ori ||
                  jal || lw || lh || lb) ? 1 : 0;

    //0:not write, 1:write
    assign MWE = (sw || sh || sb) ? 1 : 0;
    
    //0:+, 1:-, 2:lui, 3:|
    assign ALUop = (add || lw || sw || lh || sh || lb || sb) ? 0 :
                   (sub || beq) ? 1 : 
                   (lui) ? 2 : 
                   (ori) ? 3 : 0;
    
    //0:unsigned, 1:signed
    assign EXTop = (sw || lw || sh || lh || sb || lb) ? 1 : 0;

    //0:PC+4, 1:branch, 2:j, 3:j-register
    assign NPCop = (beq || bne) ? 1 : 
                   (j || jal) ? 2 :
                   (jr) ? 3 : 0;

    //0:beq 1:bne 2:0
    assign CMPop = (beq) ? 0 : 
                   (bne) ? 1 : 2;

    //0:word, 1:halfword, 2:byte
    assign DMRop = (lh) ? 1 :
                   (lb) ? 2 : 0;
    
    //0:word, 1:halfword, 2:byte
    assign DMWop = (sh) ? 1 :
                   (sb) ? 2 : 0;               

    //0:rt, 1:rd, 2:31($ra)
    assign RWAsel = (lw || lh || lb || lui || ori) ? rt :
                    (add || sub) ? rd :
                    (jal) ? 5'd31 : 5'd0;
               
    //0:ALUout, 1:DMout, 2:PC+8
    assign RWDsel = (add || sub || lui || ori) ? 0 :
                    (lw || lh || lb) ? 1 : 
                    (jal) ? 2 : 0;
    
    //0:RD2, 1:EXTout
    assign ALUBsel = (sw || lw || sh || lh || sb || lb ||
                      ori || lui) ? 1 : 0;

endmodule
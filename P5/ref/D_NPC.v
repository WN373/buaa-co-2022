module D_NPC (
    input [31:0] F_PC,
    input [31:0] D_PC,
    input [25:0] imm26,
    input [31:0] rs_data,
    input need_b,
    input [2:0] NPCop,
    output [31:0] NPC
);
    assign NPC = (NPCop == 0) ? F_PC + 4 :
                 (NPCop == 1 && need_b) ? {{14{imm26[15]}}, imm26[15:0], 2'b00} + D_PC + 4 :
                 (NPCop == 2) ? {D_PC[31:28], imm26, 2'b00} : 
                 (NPCop == 3) ? rs_data : F_PC + 4; 
    
endmodule
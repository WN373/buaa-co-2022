module NPC(
    input [2:0] nPC_sel,
    /*
    0: 
    */
    input [31:0] pc,
    input [31:0] imm32, reg_ra,
    input [26:0] imm26,
    output reg [31:0] npc
);
    always @* begin
        case (nPC_sel) 
            0: npc = pc + 4;
            1: npc = pc + 4 + ($signed(imm32) <<< 2);
            2: npc = reg_ra;
            3: npc = {pc[31:28], imm26, 2'b0};
            default: npc = npc;
        endcase
    end

endmodule
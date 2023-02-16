module Fetch(
    input clk, reset, pause,
    input branch,
    input [31:0] DnPC,
    output [31:0] F_PC
);
    
    wire [31:0] nPC = branch ? DnPC : (F_PC + 4);

    PC upc(
        // input
        .npc(nPC),
        .reset(reset),
        .clk(clk),
        .pause(pause),
        // output
        .pc(F_PC)
    );

    // NPC unpc(
    //     // inp
    //     .pc(F_PC),
    //     .nPC_sel(nPC_sel),
    //     .imm32(imm32),
    //     .imm26(imm26),
    //     .reg_ra(reg_ra),
    //     // outp
    //     .npc(nPC)
    // );

    // IM uim(
    //     // inp
    //     .pc(F_PC),
    //     // outp
    //     .instr(F_ins)
    // );





endmodule
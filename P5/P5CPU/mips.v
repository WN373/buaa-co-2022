`timescale 1ns/1ps

module mips (
    input clk,
    input reset
);
    // Fetch Phase

    wire [31:0] F_ins, F_PC;
    wire [2:0] nPC_sel;

    


    // IF/ID
    IF2ID uf2d(
        // input
        .reset(reset),
        .clk(clk),

        // output

    );

    // Decode Phase

    // ------------- SPL bgn ---------------
    wire [31:0] Dinstr, imm32;
    wire [5:0] opt = Dinstr[_opt]
            , func = Dinstr[_funct];
    wire [4:0] rs = Dinstr[_rs]
            , rt = Dinstr[_rt]
            , rd = Dinstr[_rd]
            , shamt = Dinstr[_shamt];
    wire [15:0] imm16 = Dinstr[_imm16];
    wire [25:0] imm26 = Dinstr[_imm26];
    // ------------- SPL end ---------------

    EXT uext(
        // input
        .sign_sel(sign_sel),
        .imm16(imm16),
        // output
        .imm32(imm32)
    );

    GRF ugrf(
        // input 
        .reset(reset),
        .clk(clk),
        .reg_we(  ),
        .reg_adr1(rs),
        .reg_adr2(rt),
        .reg_adr3(  ),
        .reg_wd(  ),
        .WPC(D)

    );








    
endmodule
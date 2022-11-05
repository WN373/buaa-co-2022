module Controller(
    input [5:0] optCode, funcCode,
    output reg_write_enable, mem_write_enable, 
    output [3:0] alu_op, 
    output [2:0] ext_op, nPC_sel, alu_src, 
                regw_dst, regw_src, width
);
    
    wire special = (optCode == 0) ? 1 : 0;

    wire add = (special && funcCode == 6'b100000) ? 1 : 0;
    wire sub = (special && funcCode == 6'b100010) ? 1 : 0;
    wire ori = (optCode == 6'b001101) ? 1 : 0; 
    wire lw  = (optCode == 6'b100011) ? 1 : 0;
    wire sw  = (optCode == 6'b101011) ? 1 : 0;
    wire beq = (optCode == 6'b000100) ? 1 : 0;
    wire lui = (optCode == 6'b001111) ? 1 : 0;
    wire jal = (optCode == 6'b000011) ? 1 : 0;
    wire jr  = (special && funcCode == 6'b001000) ? 1 : 0;
    wire sll = (special && funcCode == 0) ? 1 : 0;

    assign width = 0; // 00: word
    assign alu_op = {1'b0, sll, ori, ori||sub};
    /*
    000:+ ; 001:- ; 010:& ; 011:| ; 100:<< ;
    000:==; 001:> ;
    */
    assign ext_op = {1'b0, lui, lw||sw||beq};
    /*
    000: unsigned;
    001: signed;
    010: tohigh
    */
    assign nPC_sel = {1'b0, (jr||jal), (beq||jal)};
    /*
    000: PC+4
    001: PC+4+offset||00
    010: jr
    011: jal/j
    */
    assign alu_src = {2'b0, (sw || lw || ori)};
    /*
    000: grf_rd2
    001: imm32
    */
    assign regw_dst = {1'b0, jal, (add || sll || sub)};// 0: rt , 1: rd, 2: 31
    assign regw_src = {1'b0, jal || lui, jal || lw};
    /*
    000 : alu_res (r)
    001 : mem_read (load wd)
    010 : imm32 (load i)
    011 : PC+4 (jal)
    */
    assign reg_write_enable = (sw || add || sub || ori ||
                             lui || sll || jal) ? 1 : 0;
    assign mem_write_enable = (sw) ? 1 : 0;

endmodule
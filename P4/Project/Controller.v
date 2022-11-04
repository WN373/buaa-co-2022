module Controller(
    input [5:0] optCode, funcCode,
    output reg_write_enable, mem_write_enable, 
    output [3:0] alu_op, 
    output [2:0] ext_op, nPC_sel
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

    assign alu_op = {1'b0, sll, 1'b0, sub};
    /*
    000:+ ; 001:- ; 010:& ; 011:| ; 100:<< ;
    000:==; 001:> ;
    */
    assign ext_op = {1'b0, lui, lw&&sw};
    /*
    000: unsigned;
    001: signed;
    010: tohigh
    */

endmodule
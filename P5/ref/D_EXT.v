module D_EXT (
    input [15:0] imm16,
    input EXTop,
    output [31:0] EXTout
);

    assign EXTout = EXTop ? {{16{imm16[15]}}, imm16} : {{16{1'b0}}, imm16};
    
endmodule
module EXT(
    input ext_op,
    input [15:0] imm16,
    output [31:0] imm32
);
    assign imm32 =  (ext_op == 0) ? {16'b0, imm16} :
                    (ext_op == 1) ? {{16{imm16[15]}} , imm16} :
                    (ext_op == 2) ? {imm16, 16'b0} : 
                    0;

endmodule
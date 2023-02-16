module EXT(
    input [2:0] ext_op,
    input [15:0] imm16,
    input [31:0] grt,
    output [31:0] imm32
);
    assign imm32 =  (ext_op == 0) ? {16'b0, imm16} :
                    (ext_op == 1) ? {{16{imm16[15]}} , imm16} :
                    (ext_op == 2) ? {imm16, 16'b0} :
                    (ext_op == 3) ? $signed({{16{imm16[15]}}, imm16}) <<< (grt[1:0]) :
                    0;

endmodule
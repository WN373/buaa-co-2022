module ALU(
    input [31:0] A1, A2,
    input [2:0] alu_op,
    output [31:0] alu_res
);
    assign alu_res = (alu_op == 0) ? A1 + A2 :
                    (alu_op == 1) ? A1 - A2 :
                    (alu_op == 2) ? (A2 << A1) :
                    0;

endmodule
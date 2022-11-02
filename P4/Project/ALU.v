module ALU(
    input [31:0] A1, A2,
    input [3:0] alu_op,
    output [31:0] int_res,
    output bool_res
    );  

    assign int_res = (alu_op == 0) ? A1 + A2 :
                    (alu_op == 1) ? A1 - A2 :
                    (alu_op == 2) ? A1 & A2 :
                    (alu_op == 3) ? A1 | A2 :
                    (alu_op == 4) ? A2 << A1 : 0;
    
    assign bool_res = (alu_op == 0) ? (A1==A2 ? 1 : 0) :
                    (alu_op == 1 ? (A1>A2 ? 1 : 0) : 0;
    


endmodule
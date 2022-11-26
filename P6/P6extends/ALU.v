module ALU(
    input [31:0] A1, A2,
    input [4:0] alu_op,
    output reg [31:0] alu_res
);
    // assign alu_res = (alu_op == 0) ? A1 + A2 :
    //                 (alu_op == 1) ? A1 - A2 :
    //                 (alu_op == 2) ? (A1 | A2) :
    //                 (alu_op == 3) ? (A2 << A1) : 0;
    always @* begin
        case (alu_op)
            0 : alu_res <= A1 + A2;
            1 : alu_res <= A1 - A2;
            2 : alu_res <= (A1 | A2);
            3 : alu_res <= (A2 << A1[4:0]);
            4 : alu_res <= (A1 & A2);
            5 : alu_res <= ($signed(A1) < $signed(A2)) ? 1 : 0;
            6 : alu_res <= ({1'b0,A1} < {1'b0,A2}) ? 1 : 0;
            7 : alu_res <= (A1 ^ A2);
            8 : alu_res <= ~(A1 | A2);
            9 : alu_res <= (A2 >> A1[4:0]);
            10: alu_res <= ($signed(A2) >>> A1[4:0]);
            default : alu_res <= 0;
        endcase
    end

endmodule
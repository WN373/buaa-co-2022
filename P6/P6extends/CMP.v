module CMP(
    input [31:0] A1, A2,
    input [2:0] brc_op,
    output bool_res
);

    assign bool_res = (brc_op == 0) ? 1 :
                        (brc_op == 1) ? (A1 == A2) :
                        (brc_op == 2) ? (A1 != A2) :
                        (brc_op == 3) ? ($signed(A1) >= 0) :
                        (brc_op == 4) ? ($signed(A1) <= 0) :
                        (brc_op == 5) ? ($signed(A1) > 0) :
                        (brc_op == 6) ? ($signed(A1) < 0) :
                        0;



endmodule
module ALU(
    input [31:0] A1, A2,
    input [2:0] alu_op,
    output [31:0] alu_res
);

    function [31:0] abs ;
        input [31:0] x, y;
        begin
            if ($signed(x) > $signed(y)) begin
                abs = x-y ;
            end else begin
                abs = y-x;
            end
        end
    endfunction

    assign alu_res = (alu_op == 0) ? A1 + A2 :
                    (alu_op == 1) ? A1 - A2 :
                    (alu_op == 2) ? (A1 | A2) :
                    (alu_op == 3) ? (A2 << A1) :
                    (alu_op == 4) ? abs(A1 , A2) : 0;

endmodule
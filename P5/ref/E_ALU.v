module E_ALU (
    input [31:0] A,
    input [31:0] B,
    input [4:0] shamt,
    input [3:0] ALUop,
    output reg [31:0] ALUresult
);
    always @(*) begin
        case(ALUop)
            0: ALUresult = A + B;
            1: ALUresult = A - B;
            2: ALUresult = B << 16;
            3: ALUresult = A | B;
            default: ALUresult = 0;
        endcase
    end

    function [31:0] cnt;
	    input [31:0] A;
		input [31:0] B;
		integer i;
		begin
		    cnt = 0;
			for(i = 0;i < 32;i = i + 1) begin
				if(A[i] && B[i]) cnt = cnt + 1; 
			end
        end
	endfunction

    function over;
	    input [31:0] A;
		input [31:0] B;
		reg [32:0] temp;
		begin
		    temp = {A[31], A} + {B[31], B};
            over = (temp[32] != temp[31]);
        end
	endfunction

endmodule 
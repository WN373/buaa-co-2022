
module EXT(
    input [15:0] imm16,
    input [2:0] ext_op,
    output reg [31:0] imm32
);
    integer i = 0;

    initial begin
        imm32 = 0;
    end

    always @* begin
        case (ext_op) 
            0: begin
                imm32 = {16'h0000, imm16};
            end
            1: begin
                imm32 = {{16{imm16[15]}}, imm16};
            end
            2:  begin
                imm32 = {imm16, 16'h0000};
            end
            3: begin
                imm32 = {14'h0, imm16, 2'b0}; 
            end
            default: imm32 = 0;
        endcase
    end

endmodule

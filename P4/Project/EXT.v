
module EXT(
    input [15:0] imm16,
    input [3:0] ext_op,
    output reg [31:0] imm32
);
    integer i = 0;

    initial begin
        imm32 = 0;
    end

    always @* begin
        case (ext_op) 
            0: imm32[15:0] = imm16;
            1: begin
                imm32[15:0] = imm16;
                for (i=16; i<32; i=i+1) begin
                    imm32[i] = imm16[15];
                end
            end
            2: imm32[31:16] = imm16;
            default: imm32 = 0;
        endcase
    end

endmodule

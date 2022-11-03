module IFU(
    input clk, reset,
    input [2:0] nPC_sel,
    input [31:0] imm32, PC_jr
    output [31:0] PCa4, instr
);
    reg [31:0] IM_reg [0:2047];
    reg [31:0] PC = 32'h3000;
    wire [31:0] PCm3;

    initial begin
        $readmemh("code.txt", IM_reg);
    end

    assign PCm3 = PC - 32'h3000;
    assign PCa4 = PC + 4;
    assign instr = IM_reg[PCm3[12:2]]

    always @(posedge clk) begin
        case (nPC_sel) 
            0: PC <= PCa4;              // PC = PC + 4
            1: PC <= PCa4 + imm32;      // PC = PC + 4 + offset
            2: PC <= PC_jr;             // PC = PC_jr 
            default: PC <= PCa4;
        endcase
    end



endmodule
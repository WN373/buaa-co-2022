module IF2ID(
    input reset, clk, pause
    input [31:0] F_ins, F_PC,
    output reg[31:0] D_ins, D_PC
);
    
    initial begin
        D_ins = 0;
    end

    always @(posedge clk) begin
        if (reset || pause) begin
            D_ins = 0;
            D_PC = 0;
        end
        else begin
            D_ins <= F_ins;
            D_PC <= F_PC;
        end
    end

endmodule
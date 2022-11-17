module IF2ID(
    input reset, clk, pause,
    input [31:0] F_ins, F_PC, 
    input F_lat,
    output reg[31:0] D_ins, D_PC,
    output reg D_lat
);
    
    initial begin
        D_ins = 0;
        D_PC = 0;
        D_lat = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            D_ins = 0;
            D_PC = 0;
            D_lat = 0;
        end
        else if(!pause) begin
            D_ins <= F_ins;
            D_PC <= F_PC;
            D_lat <= F_lat;
        end
    end

endmodule
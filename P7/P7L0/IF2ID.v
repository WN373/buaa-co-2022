module IF2ID(
    input reset, clk, pause,
    input [31:0] F_ins, F_PC, 
    input [4:0] F_exccode,
    input F_lat,
    output reg[31:0] D_ins, D_PC,
    output reg [4:0] D_exccode,
    output reg D_lat
);
    
    initial begin
        D_ins = 0;
        D_PC = 0;
        D_lat = 0;
        D_exccode = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            D_ins = 0;
            D_PC = 0;
            D_lat = 0;
            D_exccode = 0;
        end
        else if(!pause) begin
            D_ins <= F_ins;
            D_PC <= F_PC;
            D_lat <= F_lat;
            D_exccode <= F_exccode;
        end
    end

endmodule
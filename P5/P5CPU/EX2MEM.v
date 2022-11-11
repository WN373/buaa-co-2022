module EX2MEM (
    input reset, clk, pause,
    input [31:0] E_ins, E_PC, E_alu_res, E_reg_rs, E_reg_rt, 
    input E_lat,
    output reg [31:0] M_ins, M_PC, M_alu_res, M_reg_rs, M_reg_rt,
    output M_lat
);
    initial begin
        M_ins = 0;
        M_PC = 0;
        M_alu_res = 0;
        M_reg_rs = 0;
        M_reg_rt = 0;
        M_lat = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            M_ins = 0;
            M_PC = 0;
            M_alu_res = 0;
            M_reg_rs = 0;
            M_reg_rt = 0;
            M_lat = 0;
        end
        else if(!pause) begin
            M_ins <= E_ins;
            M_PC <= E_PC;
            M_alu_res <= E_alu_res;
            M_reg_rs <= E_reg_rs;
            M_reg_rt <= E_reg_rt;
            M_lat <= E_lat;
        end
    end

endmodule
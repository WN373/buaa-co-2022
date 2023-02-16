module EX2MEM (
    input reset, clk, pause,
    input [31:0] E_ins, E_PC, E_alu_res, E_reg_rs, E_reg_rt, E_imm32, E_mlu_res,
    input [4:0] E_exccode,
    input E_lat,
    output reg [31:0] M_ins, M_PC, M_alu_res, M_reg_rs, M_reg_rt, M_imm32, M_mlu_res,
    output reg [5:0] M_exccode,
    output reg M_lat
);
    initial begin
        M_ins = 0;
        M_PC = 0;
        M_alu_res = 0;
        M_mlu_res = 0;
        M_reg_rs = 0;
        M_reg_rt = 0;
        M_lat = 0;
        M_imm32 = 0;
        M_exccode = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            M_ins = 0;
            M_PC = 0;
            M_alu_res = 0;
            M_mlu_res = 0;
            M_reg_rs = 0;
            M_reg_rt = 0;
            M_lat = 0;
            M_imm32 = 0;
            M_exccode = 0;
        end
        else if(!pause) begin
            M_ins <= E_ins;
            M_PC <= E_PC;
            M_alu_res <= E_alu_res;
            M_mlu_res <= E_mlu_res;
            M_reg_rs <= E_reg_rs;
            M_reg_rt <= E_reg_rt;
            M_lat <= E_lat;
            M_imm32 <= E_imm32;
            M_exccode <= E_exccode;    
        end
    end

endmodule
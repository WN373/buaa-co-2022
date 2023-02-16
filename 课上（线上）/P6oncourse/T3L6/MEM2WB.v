module MEM2WB(
    input clk, reset, pause,
    input [31:0] M_PC, M_ins, M_alu_res, M_reg_rs, M_reg_rt, M_mem_read, M_mlu_res,
    input M_lat,
    output reg [31:0] W_PC, W_ins, W_alu_res, W_reg_rs, W_reg_rt, W_mem_read, W_mlu_res,
    output reg W_lat
);
    initial begin
        W_PC = 0;
        W_ins = 0; 
        W_alu_res = 0; 
        W_mlu_res = 0;
        W_reg_rs = 0; 
        W_reg_rt = 0; 
        W_mem_read = 0;
        W_lat = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            W_PC = 0; 
            W_ins = 0; 
            W_alu_res = 0; 
            W_mlu_res = 0;
            W_reg_rs = 0; 
            W_reg_rt = 0; 
            W_mem_read = 0;
            W_lat = 0;
        end
        else if (!pause) begin
            W_PC <= M_PC; 
            W_ins <= M_ins; 
            W_alu_res <= M_alu_res; 
            W_mlu_res <= M_mlu_res;
            W_reg_rs <= M_reg_rs; 
            W_reg_rt <= M_reg_rt; 
            W_mem_read <= M_mem_read;
            W_lat <= M_lat;
        end
    end




endmodule
module MEM2WB(
    input clk, reset, pause,
    input [31:0] M_PC, M_ins, M_alu_res, M_reg_rs, M_reg_rt, M_mem_read,
    output reg [31:0] W_PC, W_ins, W_alu_res, W_reg_rs, W_reg_rt, W_mem_read
);
    initial begin
        W_PC = 0, 
        W_ins = 0, 
        W_alu_res = 0, 
        W_reg_rs = 0, 
        W_reg_rt = 0, 
        W_mem_read = 0;
    end

    always @(posedge clk) begin
        if (reset || pause) begin
            W_PC = 0, 
            W_ins = 0, 
            W_alu_res = 0, 
            W_reg_rs = 0, 
            W_reg_rt = 0, 
            W_mem_read = 0;
        end
        else begin
            W_PC <= M_PC, 
            W_ins <= M_ins, 
            W_alu_res <= M_alu_res, 
            W_reg_rs <= M_reg_rs, 
            W_reg_rt <= M_reg_rt, 
            W_mem_read <= M_mem_read;
        end
    end




endmodule
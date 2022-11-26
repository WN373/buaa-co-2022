module M_REG (
    input clk,
    input reset,
    input en,
    
    input [31:0] instr_in,
    input [31:0] PC_in,
    input [31:0] rt_data_in,
    input [31:0] ALU_in,
    input flag_in,

    output reg [31:0] instr_out,
    output reg [31:0] PC_out,
    output reg [31:0] rt_data_out,
    output reg [31:0] ALU_out,
    output reg flag_out
);
    always @(posedge clk) begin
        if(reset) begin
            instr_out <= 0;
            PC_out <= 0;
            rt_data_out <= 0;
            ALU_out <= 0;
            flag_out <= 0;
        end 
        else if(en) begin
            instr_out <= instr_in;
            PC_out <= PC_in;
            rt_data_out <= rt_data_in;
            ALU_out <= ALU_in;
            flag_out <= flag_in;
        end
        else begin
            instr_out <= instr_out;
            PC_out <= PC_out;
            rt_data_out <= rt_data_out;
            ALU_out <= ALU_out;
            flag_out <= flag_out;
        end
    end
    
endmodule
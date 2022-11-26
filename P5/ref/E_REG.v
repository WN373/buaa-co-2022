module E_REG (
    input clk,
    input reset,
    input en,

    input [31:0] instr_in,
    input [31:0] PC_in,
    input [31:0] rs_data_in,
    input [31:0] rt_data_in,
    input [31:0] EXT_in,
    input flag_in,

    output reg [31:0] instr_out,
    output reg [31:0] PC_out,
    output reg [31:0] rs_data_out,
    output reg [31:0] rt_data_out,
    output reg [31:0] EXT_out,
    output reg flag_out
);
    always @(posedge clk) begin
        if(reset) begin
            instr_out <= 0;
            PC_out <= 0;
            rs_data_out <= 0;
            rt_data_out <= 0;
            EXT_out <= 0;
            flag_out <= 0;
        end 
        else if(en) begin
            instr_out <= instr_in;
            PC_out <= PC_in;
            rs_data_out <= rs_data_in;
            rt_data_out <= rt_data_in;
            EXT_out <= EXT_in;
            flag_out <= flag_in;
        end
        else begin
            instr_out <= instr_out;
            PC_out <= PC_out;
            rs_data_out <= rs_data_out;
            rt_data_out <= rt_data_out;
            EXT_out <= EXT_out;
            flag_out <= flag_out;
        end
    end
    
endmodule
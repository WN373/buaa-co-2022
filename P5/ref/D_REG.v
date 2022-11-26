module D_REG (
    input clk,
    input reset,
    input en,
    input [31:0] instr_in,
    input [31:0] PC_in,

    output reg [31:0] instr_out,
    output reg [31:0] PC_out
);

    always @(posedge clk) begin
        if(reset) begin
            instr_out <= 0;
            PC_out <= 0;
        end
        else if(en) begin
            instr_out <= instr_in;
            PC_out <= PC_in;
        end 
        else begin
            instr_out <= instr_out;
            PC_out <= PC_out;
        end
    end    
endmodule
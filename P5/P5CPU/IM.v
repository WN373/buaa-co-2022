module IM(
    input [31:0] pc,
    output [31:0] instr
);
    reg [31:0] instr_mem [0:4095];

    initial begin
        $readmemh("code.txt", instr_mem);
    end

    wire [31:0] instr_pos = pc - 32'h3000;

    assign instr = instr_mem[instr_pos[13:2]];


endmodule
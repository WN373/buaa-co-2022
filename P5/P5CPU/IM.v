module IM(
    input [31:0] pc,
    output [31:0] instr
);
    reg [31:0] instr_mem [0:4096];

    initial begin
        $readmemh("code.txt", instr_mem);
    end

    assign instr = [instr_mem[pc[13:2]]];


endmodule
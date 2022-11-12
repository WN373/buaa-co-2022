`define PC_initial 32'h3000
module PC(
    input [31:0] npc,
    input reset, clk, pause,
    output reg [31:0] pc
);
    initial begin
        pc = `PC_initial;
    end

    always @(posedge clk) begin
        if (reset) begin
            pc <= `PC_initial;
        end
        else if(!pause) begin
            pc <= npc;
        end
    end

endmodule
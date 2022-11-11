module DM(
    input clk,
    input reset,
    input pause, memw_enable,
    input [2:0] width,
    input [31:0] mem_adr, mem_write, 
    input [31:0] MPC,
    output [31:0] mem_read, 
);

    reg [31:0] mem_reg [0:4095];
    wire [11:0] word_addr;

    assign mem_read = mem_reg[word_addr];
    assign word_addr = mem_adr[13:2];

    function RESET;
        input reset;
        integer i;
        begin
            for (i=0; i<4096; i= i+1) begin
                mem_reg[i] = 0;
            end
        end
    endfunction

    initial begin
        RESET(reset);
    end

	 
	always @(posedge clk) begin
        if (reset) begin
            RESET(reset);
        end 
        else if (memw_enable && MPC != 0) begin
            $display("@%h: *%h <= %h", MPC, mem_adr, mem_write);
            mem_reg[word_addr] <= mem_write;
        end
    end

endmodule
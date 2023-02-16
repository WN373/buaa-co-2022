module DM(
    input clk,
    input reset,
    input pause, memw_enable,
    input [2:0] width,
    input [31:0] mem_adr, mem_write, 
    input [31:0] MPC,
    output reg [31:0] mem_read,
    output reg lcond
);

    reg [31:0] mem_reg [0:4095];
    wire [11:0] word_addr;
    reg [16:0] mem_half;

    integer i = 0, cnt= 0;

    always @* begin
        if (width == 0) mem_read = mem_reg[word_addr];
        else begin
            if (mem_adr[1]) begin
                mem_half = mem_reg[word_addr][31:16]; 
                mem_read = {{16{mem_half[15]}}, mem_half };
            end else begin
                mem_half = mem_reg[word_addr][15:0];
                mem_read = {{16{mem_half[15]}}, mem_half };
            end
        end

        cnt = 0;
        for (i=0;i<16;i=i+1) begin
            if (mem_half[i]) cnt = cnt + 1;
        end
        lcond = (cnt >= 8);
    end
    
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
        else if (memw_enable) begin
            $display("%d@%h: *%h <= %h",$time,  MPC, mem_adr, mem_write);
            mem_reg[word_addr] <= mem_write;
        end
    end

endmodule
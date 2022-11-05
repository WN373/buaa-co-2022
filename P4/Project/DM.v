`timescale 1ns / 1ps


module DM(
	  input clk, 
	  input reset, 
	  input mem_write_enable,
	  input [1:0] width,
	  input [31:0] mem_addr, 
	  input [31:0] mem_write,
      input [31:0] PC,
	  output [31:0] mem_read
    );

    reg [31:0] mem_reg [0:1023];
    wire [9:0] word_addr;

    assign mem_read = mem_reg[word_addr];
    assign word_addr = mem_addr[11:2];

    function RESET;
        input reset;
        integer i;
        begin
            for (i=0; i<1024; i= i+1) begin
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
        else if (mem_write_enable) begin
            $display("@%h: $%d <= %h", PC, word_addr, mem_write);
            mem_reg[word_addr] <= mem_write;
        end
    end
    
endmodule
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:50 11/02/2022 
// Design Name: 
// Module Name:    GRF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module GRF(
    input clk,
    input reset,
    input reg_write_enable,
    input [4:0] grf_adr_1,
    input [4:0] grf_adr_2,
    input [4:0] grf_adr_3, 
    input [31:0] grf_write,
    input [31:0] PC,
    output [31:0] grf_read1,
    output [31:0] grf_read2
    );
    
    reg [31:0] grf_reg[0:31];

    function RESET;
        input reset;
        integer i;
        begin
            for (i = 0; i < 32; i = i + 1) begin
                grf_reg[i] = 0;
            end
            i = 0;
        end
    endfunction

    initial begin
        RESET(reset);
    end

    assign grf_read1 = grf_reg[grf_adr_1];
    assign grf_read2 = grf_reg[grf_adr_2];

    always @(posedge clk) begin
        if (reset) begin
            RESET(reset);
        end 
        else if (reg_write_enable) begin
            $display("@%h: $%d <= %h", PC, grf_adr_3, grf_write);
            if (grf_adr_3 != 0) begin
                grf_reg[grf_adr_3] <= grf_write;
            end
        end
    end

endmodule

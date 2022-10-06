`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:59 10/06/2022 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output reg Overflow
    );
    reg [2:0] stat;

    initial begin
        stat = 0;
        Overflow = 0;
    end

    assign Output = (stat == 0) ? 0 : 
                    (stat == 1) ? 1 :
                    (stat == 2) ? 3'b011 :
                    (stat == 3) ? 3'b010 :
                    (stat == 4) ? 3'b110 :
                    (stat == 5) ? 3'b111 :
                    (stat == 6) ? 3'b101 :
                    3'b100 ;

    always @(posedge Clk) begin
        if (Reset) begin
            stat <= 0;
            Overflow <= 0;
        end 
        else if (En) begin
            if(stat == 7) begin
                Overflow <= 1;
            end
            stat <= stat + 1;
        end
    end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:14:18 10/06/2022 
// Design Name: 
// Module Name:    expr 
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
module expr(
    input clk,
    input clr,
    input [7:0] in,
    output out
    );
 
    wire isdigit, isoper;
    assign isdigit = (in <= "9") && (in >= "0");
    assign isoper = (in == "+") || (in == "*");
    
    assign out = (stat == 1) ? 1:0;

    reg [3:0] stat;
    initial begin
        stat = 0;
    end

    always @(posedge clr) begin
        stat = 0;
    end

    always @(posedge clk) begin
        if (clr) begin
            stat <= 0;
        end
        else begin
            case (stat)
                0: begin // no input
                    if (isdigit) begin
                        stat <= 1;
                    end 
                    else begin
                        stat <= 3;
                    end
                end
                1: begin // ended with digit
                    if (isoper) begin
                        stat <= 2;
                    end
                    else begin
                        stat <= 3;
                    end
                end 
                2: begin // ended with operator
                    if (isdigit) begin 
                        stat <= 1;
                    end
                    else begin
                        stat <= 3;
                    end
                end
                3: begin // wasted

                end
                default: begin
                
                end
            endcase    
        end
        
    end


endmodule

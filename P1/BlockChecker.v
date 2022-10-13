`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:07:19 10/06/2022 
// Design Name: 
// Module Name:    BlockChecker 
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
module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result 
    );

    reg [31:0] stk, cnt; 
    reg fflg;
    reg [7:0] stat;

    initial begin
        stk = 0;
        cnt = 0;
        stat = 0;
        fflg = 0;
    end

    wire [7:0] lowerIn;
    wire isBlank;

    assign lowerIn = ((in >= "A") && (in <= "Z")) ? (in - "A" + "a") :   in;
    assign isBlank = (in == " ") ? 1 : 0;
    assign result = (((stk == 1) && (stat == 9)) || ((stk == 0) && (stat != 5) && (stat != 9))) && (~fflg) ? 1 : 0;

    always @* begin
        if(reset) begin
            stk = 0;
            cnt = 0;
            stat = 0;
            fflg = 0;
        end
    end

    always @(posedge clk) begin
        if(isBlank) begin
            case (stat)
                0: begin
                    stat <= 0;
                end 
                5: begin
                    stat <= 0;
                    stk <= stk + 1;
                    cnt <= cnt + 1;
                end
                9: begin
                    cnt <= cnt + 1;
                    stat <= 0;
                    if (stk > 0) begin
                        stk <= stk - 1;
                    end 
                    else begin
                        stk <= 0;
                        fflg <= 1;
                    end
                end
                default: begin
                    cnt <= cnt + 1;
                    stat <= 0;
                end
            endcase
        end
        else begin
            case (stat)
                0: begin
                    // if(isBlank) begin
                    //     stat <= 0;
                    // end 
                    // else 
                    if (lowerIn == "b") begin
                        stat <= 1;
                    end
                    else if (lowerIn == "e") begin
                        stat <= 7;
                    end
                    else begin
                        stat <= 11;
                    end
                end 
                1: begin
                    if (lowerIn == "e") begin
                        stat <= 2;
                    end
                    else begin
                    stat <= 11; 
                    end
                end
                2: begin
                    if (lowerIn == "g") begin
                        stat <= 3;
                    end
                    else begin
                        stat <= 11;
                    end
                end
                3: begin
                    if (lowerIn == "i") begin
                        stat <= 4;
                    end
                    else begin
                        stat <= 11;
                    end
                end
                4: begin
                    if (lowerIn == "n") begin
                        stat <= 5; 
                    end
                    else begin
                       stat <= 11; 
                    end
                end
                5: begin
                    stat <= 11;
                end
                7: begin
                    if (lowerIn == "n") begin
                        stat <= 8;
                    end
                    else begin
                        stat <= 11;
                    end
                end
                8: begin
                    if (lowerIn == "d") begin
                        stat <= 9;
                    end
                    else begin
                        stat <= 11;
                    end
                end
                default: stat <= 11;
            endcase
        end
    end


endmodule

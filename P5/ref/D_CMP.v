module D_CMP (
    input [31:0] rs_data,
    input [31:0] rt_data,
    input [3:0] CMPop, 
    output reg need_b
);
    always @(*) begin
        case(CMPop)
            0: begin
                need_b = (rs_data == rt_data);
            end
            1: begin
                need_b = (rs_data != rt_data);
            end 
            default: begin
                need_b = 0;
            end 

        endcase
    end

endmodule
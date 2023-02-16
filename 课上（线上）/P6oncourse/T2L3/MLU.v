`include "macros.v"

module MLU(
    input clk, reset, start,
    input [31:0] D1, D2,
    input [3:0] mlu_op,        // 0 : do not do anything
    output reg [31:0] HI, LO,
    output reg busy
);

    reg [31:0] tmp_lo, tmp_hi, cnt;

    initial begin
        HI = 0; 
        LO = 0;
        busy = 0;
        tmp_lo = 0;
        tmp_hi = 0;
        cnt = 0;
    end 

    always @(posedge clk) begin
        if (reset) begin
            HI <= 0;
            LO <= 0;
            busy <= 0;
            cnt <= 0;
        end
        else begin
            if (cnt == 0) begin
                if (start) begin
                    busy = 1;
                    if (mlu_op == `MLU_multu) begin
                        cnt <= 5;
                        {tmp_hi, tmp_lo} <= D1 * D2;
                    end
                    else if (mlu_op == `MLU_mult) begin
                        cnt <= 5;
                        {tmp_hi, tmp_lo} <= $signed(D1) * $signed(D2);
                    end
                    else if (mlu_op == `MLU_div) begin
                        cnt <= 10;
                        tmp_lo <= $signed(D1) / $signed(D2);
                        tmp_hi <= $signed(D1) % $signed(D2);
                    end
                    else if (mlu_op == `MLU_divu) begin
                        cnt <= 10;
                        tmp_lo <= (D1) / (D2);
                        tmp_hi <= (D1) % (D2);
                    end else if (mlu_op == `MLU_mthi) begin
                        cnt <= 0;
                        busy = 0;
                        HI <= D1;
                    end else if (mlu_op == `MLU_mtlo) begin
                        cnt <= 0;
                        busy = 0;
                        LO <= D1;
                    end else if (mlu_op == `MLU_fdiv) begin
                        cnt <= 3;
                        tmp_lo <= $signed(D1) / $signed(D2);
                        tmp_hi <= $signed(D1) % $signed(D2);
                    end
                end
                else begin
                    cnt <= 0;
                end
            end else if (start) begin
                    busy = 1;
                    if (mlu_op == `MLU_multu) begin
                        cnt <= 5;
                        {tmp_hi, tmp_lo} <= D1 * D2;
                    end
                    else if (mlu_op == `MLU_mult) begin
                        cnt <= 5;
                        {tmp_hi, tmp_lo} <= $signed(D1) * $signed(D2);
                    end
                    else if (mlu_op == `MLU_div) begin
                        cnt <= 10;
                        tmp_lo <= $signed(D1) / $signed(D2);
                        tmp_hi <= $signed(D1) % $signed(D2);
                    end
                    else if (mlu_op == `MLU_divu) begin
                        cnt <= 10;
                        tmp_lo <= (D1) / (D2);
                        tmp_hi <= (D1) % (D2);
                    end 
                    else if (mlu_op == `MLU_fdiv) begin
                        cnt <= 3;
                        tmp_lo <= $signed(D1) / $signed(D2);
                        tmp_hi <= $signed(D1) % $signed(D2);
                    end
            end else if (cnt == 1) begin
                HI <= tmp_hi;
                LO <= tmp_lo;
                busy <= 0;
                cnt <= 0;
            end
            else begin
                cnt <= cnt - 1;
            end
        end
    end


endmodule
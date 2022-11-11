`include "macros.v"

module hazard(
    input [31:0] D_ins, E_ins, M_ins,
    input [31:0] D_rs_o, D_rt_o, E_rs_o, E_rt_o ,
    input [4:0] E_ad, M_ad, W_ad,
    input [31:0] E_wd, M_wd, W_wd,
    
    output reg [31:0] D_rs_m, D_rt_m, E_rs_m, E_rt_m,
    output reg D_pause, D2E_pause, E_pause, E2M_pause
);

    initial begin
        D_rs_m = 0;
        D_rt_m= 0;
        E_rs_m = 0;
        E_rt_m = 0;
        D_pause = 0;
        D2E_pause = 0;
        E_pause = 0;
        E2M_pause = 0;
    end

    wire [4:0] D_rs = D_ins[_rs],
               D_rt = D_ins[_rt],
               E_rs = E_ins[_rs],
               E_rt = E_ins[_rt];


    always @* begin
        if (E_ors == M_ad) begin
            
        end
    end



endmodule
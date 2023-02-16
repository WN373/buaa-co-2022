`include "macros.v"

module hazard(
    input [31:0] D_ins, E_ins, M_ins,
    input [31:0] D_rs_o, D_rt_o, E_rs_o, E_rt_o , M_rt_o,
    input [4:0] E_ad, M_ad, W_ad, ET, MT, WT,
    input [31:0] E_wd, M_wd, W_wd,
    
    output [31:0] D_rs_m, D_rt_m, E_rs_m, E_rt_m, M_rt_m,
    output Pause_before_E // clear D2E, pause F2D, Fetch
);

    // initial begin
    //     D_rs_m = 0;
    //     D_rt_m= 0;
    //     E_rs_m = 0;
    //     E_rt_m = 0;
    //     D_pause = 0;
    //     D2E_pause = 0;
    //     E_pause = 0;
    //     E2M_pause = 0;
    // end

    wire D_jap = D_ins[`_opt] == `JAP,
        E_jap = E_ins[`_opt] == `JAP,
        M_jap = M_ins[`_opt] == `JAP;

    wire [4:0] D_rs = D_ins[`_rs],
               D_rt = D_jap ? 29 : D_ins[`_rt],
               E_rs = E_ins[`_rs],
               E_rt = E_jap ? 29 : E_ins[`_rt],
               M_rt = M_jap ? 29 : M_ins[`_rt];
    wire [4:0] D_rst, D_rtt;

    CU hcu(
        .instr(D_ins),
        // output
        .rsT(D_rst),
        .rtT(D_rtt)
    );

    assign M_rt_m = (M_rt == 0) ? 0:
                    (M_rt == W_ad) ? W_wd:
                    M_rt_o;
    assign E_rs_m = (E_rs == 0) ? 0:
                    (E_rs == M_ad) ? M_wd:
                    (E_rs == W_ad) ? W_wd:
                    E_rs_o;
    assign E_rt_m = (E_rt == 0) ? 0:
                    (E_rt == M_ad) ? M_wd:
                    (E_rt == W_ad) ? W_wd:
                    E_rt_o;
    assign D_rs_m = (D_rs == 0) ? 0:
                    (D_rs == E_ad) ? E_wd:
                    (D_rs == M_ad) ? M_wd:
                    (D_rs == W_ad) ? W_wd:
                    D_rs_o;
    assign D_rt_m = (D_rt == 0) ? 0:
                    (D_rt == E_ad) ? E_wd:
                    (D_rt == M_ad) ? M_wd:
                    (D_rt == W_ad) ? W_wd:
                    D_rt_o;


    wire stall_rs = (D_rst < ET && D_rs == E_ad) 
                    || (D_rst + 1 < MT && D_rs == M_ad)
                    ;
    wire stall_rt = (D_rtt < ET && D_rt == E_ad)
                    || (D_rtt + 1 < MT && D_rt == M_ad); 
    
    assign Pause_before_E = (D_rs != 0 && stall_rs) || (D_rt != 0 && stall_rt);

endmodule
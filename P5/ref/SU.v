module SU (
    input [31:0] D_instr,
    input [31:0] E_instr,
    input [31:0] M_instr,
    output stall
);
    wire D_cal_r, D_cal_i, D_load, D_store, D_branch, D_jump_i, D_jump_r;
    wire [4:0] D_rs, D_rt;
    CU D_cu (
        .instr(D_instr),
        .rs(D_rs),
        .rt(D_rt),
        .cal_r(D_cal_r),
        .cal_i(D_cal_i),
        .load(D_load),
        .store(D_store),
        .branch(D_branch),
        .jump_i(D_jump_i),
        .jump_r(D_jump_r)
    );
    wire [2:0] Tuse_rs, Tuse_rt;
    assign Tuse_rs = (D_branch || D_jump_r) ? 0 :
                     (D_cal_r || D_cal_i || D_load || D_store) ? 1 : 3;
    assign Tuse_rt = (D_branch) ? 0 :
                     (D_cal_r) ? 1 :
                     (D_store) ? 2 : 3;


    wire E_cal_r, E_cal_i, E_load;
    wire [4:0] E_RWA;
    CU E_cu (
        .instr(E_instr),
        .cal_r(E_cal_r),
        .cal_i(E_cal_i),
        .load(E_load),
        .RWAsel(E_RWA)
    );
    wire [2:0] Tnew_E;
    assign Tnew_E = (E_cal_r || E_cal_i) ? 1 :
                    (E_load) ? 2 : 0;


    wire M_cal_r, M_cal_i, M_load;
    wire [4:0] M_RWA;
    CU M_cu (
        .instr(M_instr),
        .cal_r(M_cal_r),
        .cal_i(M_cal_i),
        .load(M_load),
        .RWAsel(M_RWA)
    );
    wire [2:0] Tnew_M;
    assign Tnew_M = (M_load) ? 1 : 0;
    
    assign stall = ((Tuse_rs < Tnew_E) && (D_rs == E_RWA) && D_rs) ||
                   ((Tuse_rs < Tnew_M) && (D_rs == M_RWA) && D_rs) ||
                   ((Tuse_rt < Tnew_E) && (D_rt == E_RWA) && D_rt) ||
                   ((Tuse_rt < Tnew_M) && (D_rt == M_RWA) && D_rt);

    
endmodule
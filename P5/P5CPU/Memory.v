module Memory(
    input reset, clk, 
    input [31:0] M_ins, M_PC, alu_res, reg_rs, reg_rt,
    output [31:0] mem_adr, mem_write,
    output memw_enable
);
    assign mem_adr = alu_res;
    assign mem_write = reg_rt;

    CU ucum(
        .instr(M_ins),
        // output
        .memw_enable(memw_enable)
    );
    

endmodule
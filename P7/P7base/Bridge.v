module Bridge(
    input [31:0] br_adr, br_wd,
    input br_we,
    input [31:0] dev0_rd, dev1_rd,
    
    output [31:0] br_rd, dev_adr, dev_wd,
    output dev0_we, dev1_we
);

    assign dev_adr = br_adr;
    assign dev_wd = br_wd;

    assign dev0_we = br_we && br_adr[4] == 0;
    assign dev1_we = br_we && br_adr[4] == 1;

    assign br_rd = br_adr[4] == 0 ? dev0_rd : dev1_rd;

endmodule
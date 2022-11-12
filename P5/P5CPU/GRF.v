module GRF(
    input reset, clk, pause, reg_we,
    input [4:0] reg_adr1,reg_adr2,reg_adr3,
    input [31:0] reg_wd, WPC,
    output[31:0] reg_rd1, reg_rd2
);
    reg [31:0] reg_mem[0:31];

    function RESET;
        input reset;
        integer i;
        begin
            if(reset) begin
                for (i=0; i<32; i=i+1) begin
                    reg_mem[i] = 0;
                end
            end
        end
    endfunction

    initial begin
        RESET(1);
    end

    assign reg_rd1 = (reg_adr1 == reg_adr3 && reg_adr1 != 0 && reg_we) ? reg_wd : reg_mem[reg_adr1];
    assign reg_rd2 = (reg_adr2 == reg_adr3 && reg_adr2 != 0 && reg_we) ? reg_wd : reg_mem[reg_adr2];
    

    always @(posedge clk) begin
        if (reset) begin
            RESET(1);
        end
        else if (reg_we) begin
            if(reg_adr3 != 0 && !pause) begin
                $display("@%h: $%d <= %h",  WPC, reg_adr3, reg_wd);
                reg_mem[reg_adr3] <= reg_wd;
            end
        end
    end

endmodule
module ID2EX(
    input reset, clk, pause,
    input [31:0] Dimm32, Dreg_rs, Dreg_rt, D_PC, D_ins,
    output reg [31:0] Eimm32, Ereg_rs, Ereg_rt, E_PC, E_ins
);
    initial begin
        Eimm32 = 0;
        Ereg_rs = 0;
        Ereg_rt = 0;
        E_PC = 0;
        E_ins = 0;
    end

    always @(posedge clk) begin
        if (reset || pause) begin
            Eimm32 = 0;
            Ereg_rs = 0;
            Ereg_rt = 0;
            E_PC = 0;
            E_ins = 0;
        end
        else begin
            Eimm32 <= Dimm32;
            Ereg_rs <= Dreg_rs;
            Ereg_rt <= Dreg_rt;
            E_PC <= D_PC;
            E_ins <= D_ins;
        end
    end


endmodule
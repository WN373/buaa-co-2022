module ID2EX(
    input reset, clk, pause,
    input [31:0] Dimm32, Dreg_rs, Dreg_rt, D_PC, D_ins, 
    input [4:0] D_exccode,
    input D_lat,
    output reg [31:0] Eimm32, Ereg_rs, Ereg_rt, E_PC, E_ins, 
    output reg [4:0] E_exccode,
    output reg E_lat
);
    initial begin
        Eimm32 = 0;
        Ereg_rs = 0;
        Ereg_rt = 0;
        E_PC = 0;
        E_ins = 0;
        E_lat = 0;
        E_exccode = 0;
    end

    always @(posedge clk) begin
        if (reset) begin
            Eimm32 = 0;
            Ereg_rs = 0;
            Ereg_rt = 0;
            E_PC = D_PC;
            E_ins = 0;
            E_lat = D_lat;
            E_exccode = 0;
        end
        else if(!pause) begin
            Eimm32 <= Dimm32;
            Ereg_rs <= Dreg_rs;
            Ereg_rt <= Dreg_rt;
            E_PC <= D_PC;
            E_ins <= D_ins;
            E_lat <= D_lat;
            E_exccode <= D_exccode;
        end
    end


endmodule
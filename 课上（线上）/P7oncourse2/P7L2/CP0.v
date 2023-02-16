`define SRAddr		12
`define CAUSEAddr	13
`define EPCAddr		14
`define EBaseAddr   15

module CP0(
    input clk, reset, en, bd_in, exl_clr, 
    input [4:0] cp0_adr, exc_code,
    input [31:0] cp0_wd, vpc,
    input [5:0] hw_int,
    output [31:0] cp0_rd, epc_out, ebase_out,
    output req
);

    reg [31:0] SR, Cause, EPC, EBase;
    assign epc_out = en && cp0_adr==`EPCAddr ? cp0_wd : EPC;
    assign ebase_out = en && cp0_adr==`EBaseAddr ? cp0_wd : EBase;

`define IM      SR[15:10]
`define EXL     SR[1]
`define IE      SR[0]
`define BD      Cause[31]
`define hwint_pend  Cause[15:10]
`define ExcCode     Cause[6:2]

    initial begin
        SR = 0;
        Cause = 0;
        EPC = 0;
        EBase = 32'h4180;
    end

    assign cp0_rd = (cp0_adr == `SRAddr) ? SR:
                    (cp0_adr == `CAUSEAddr) ? Cause :
                    (cp0_adr == `EPCAddr) ? en ? cp0_wd : EPC : 
                    (cp0_adr == `EBaseAddr) ? en ? cp0_wd : EBase :
                    32'b0;

    wire inter_int = (exc_code != 0);
    wire exter_int = (|(hw_int & `IM)) & `IE;
    assign req = (inter_int | exter_int) & !`EXL;

    always @(posedge clk) begin
        if (reset) begin
            SR = 0;
            Cause = 0;
            EPC = 0;
            EBase = 32'h4180;
        end
        else begin
            `hwint_pend <= hw_int;
            if(exl_clr) begin
                `EXL <= 0;
            end 
            else if(req) begin
                `BD <= bd_in;
                EPC <= bd_in ? {vpc[31:2] - 1, vpc[1:0]} : {vpc[31:2], vpc[1:0]};
                `ExcCode <= exter_int ? 5'b0 : exc_code;
                `EXL <= 1;
            end 
            else if(en) begin
                if (cp0_adr == `SRAddr) begin
                    SR <=  cp0_wd;
                end else if (cp0_adr == `EPCAddr) begin
                    EPC <= cp0_wd;
                end else if (cp0_adr == `CAUSEAddr) begin
                    Cause <= cp0_wd;
                end else if (cp0_adr == `EBaseAddr) begin
                    EBase <= cp0_wd;
                end
            end 
        end
            
    end     




endmodule
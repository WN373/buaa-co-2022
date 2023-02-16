`include "macros.v"
module Memory(
    input reset, clk, 
    input [31:0] M_ins, M_PC, alu_res, mlu_res, reg_rs, reg_rt, imm32, mem_read_raw,
    output [31:0] mem_adr, 
    output reg [31:0] mem_write, mem_read,
    output memw_enable,  
    output reg [3:0] byteen,
    output [4:0] regw_adr, T,
    output [31:0] reg_write
);
    assign mem_adr = (width == 1) ? {alu_res[31:2], 2'b0} : alu_res;
    // assign mem_write = reg_rt;
    wire [4:0] rt = M_ins[`_rt],
                rs = M_ins[`_rs],
                rd = M_ins[`_rd];
    wire regw_enable, sign_ext;
    wire [3:0] regw_src, regw_dst;
    wire [2:0] width;
    assign regw_adr = (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt :
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f :
                        (regw_dst == 3) ? (
                            $signed(reg_rt) < $signed(mem_read) ? 5'd5 : 5'd4
                        ) :
                        0;
    assign reg_write = (regw_src == 0) ? alu_res :
                        (regw_src == 1) ? 0 :
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? M_PC+8 :
                        (regw_src == 4) ? mlu_res : 0 ;

    initial begin
        mem_write = 0;
        mem_read = 0;
        byteen = 0;
    end

    always @* begin
        if (sign_ext) begin
            if (width == 1) begin
                mem_read = mem_read_raw;
            end else if (width == 2) begin
                if (mem_adr[1:0] == 2'b0) begin
                    mem_read = {{16{mem_read_raw[15]}} , mem_read_raw[15:0]};
                end else if (mem_adr[1:0] == 2'b10) begin
                    mem_read = {{16{mem_read_raw[31]}} , mem_read_raw[31:16]};
                end
            end else if (width == 3) begin
                if (mem_adr[1:0] == 2'b00) begin
                    mem_read = {{24{mem_read_raw[7]}} , mem_read_raw[7:0]};
                end else if (mem_adr[1:0] == 2'b01) begin
                    mem_read = {{24{mem_read_raw[15]}} , mem_read_raw[15:8]};
                end else if (mem_adr[1:0] == 2'b10) begin
                    mem_read = {{24{mem_read_raw[23]}} , mem_read_raw[23:16]};
                end else if (mem_adr[1:0] == 2'b11) begin
                    mem_read = {{24{mem_read_raw[31]}} , mem_read_raw[31:24]};
                end 
            end 
        end
    end

    always @* begin
        if (memw_enable) begin
            if (width == 1) begin
                byteen = 4'b1111;
                mem_write = reg_rt;
            end else if (width == 2) begin
                if (mem_adr[1:0] == 2'b0) begin
                    byteen = 4'b0011;
                    mem_write = reg_rt;
                end else if (mem_adr[1:0] == 2'b10) begin
                    byteen = 4'b1100;
                    mem_write = reg_rt << 16;
                end
                else byteen = 0;
            end else if (width == 3) begin
                if (mem_adr[1:0] == 2'b00) begin
                    byteen = 4'b0001;
                    mem_write = reg_rt;
                end else if (mem_adr[1:0] == 2'b01) begin
                    byteen = 4'b0010; 
                    mem_write = reg_rt << 8;
                end else if (mem_adr[1:0] == 2'b10) begin
                    byteen = 4'b0100;
                    mem_write = reg_rt << 16;
                end else if (mem_adr[1:0] == 2'b11) begin
                    byteen = 4'b1000;
                    mem_write = reg_rt << 24;
                end else byteen = 0;
            end else byteen = 0;
        end else byteen = 0;
    end

    CU ucum(
        .instr(M_ins),
        // output
        .memw_enable(memw_enable),
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .width(width),
        .sign_ext(sign_ext),
        .T(T)
    );
    

endmodule
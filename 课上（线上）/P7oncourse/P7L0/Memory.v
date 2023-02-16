`include "macros.v"
module Memory(
    input reset, clk, req,
    input [31:0] M_ins, M_PC, alu_res, mlu_res, reg_rs, reg_rt, imm32, mem_read_raw,
    output [31:0] mem_adr, 
    output reg [31:0] mem_write, mem_read,
    output memw_enable, cp0_we, eret,
    output [3:0] byt_dm, byt_i, byt_dv,
    output [4:0] regw_adr, T, exc_code, cp0_adr,
    output [31:0] reg_write
);
    assign mem_adr = alu_res;
    // assign mem_write = reg_rt;
    wire [4:0] rt = M_ins[`_rt],
                rs = M_ins[`_rs],
                rd = M_ins[`_rd];
    wire regw_enable, sign_ext, save, load, syscall;
    wire [3:0] regw_src, regw_dst;
    wire [2:0] width;
    reg [3:0] byteen;
    assign regw_adr = (!regw_enable) ? 0 :
                        (regw_dst == 0) ? rt :
                        (regw_dst == 1) ? rd :
                        (regw_dst == 2) ? 5'h1f :
                        0;
    assign reg_write = (regw_src == 0) ? alu_res :
                        (regw_src == 1) ? 0 :
                        (regw_src == 2) ? imm32 :
                        (regw_src == 3) ? M_PC+8 :
                        (regw_src == 4) ? mlu_res : 0 ;

    wire acsm = save || load;
    wire inDM = mem_adr <= 32'h2fff && mem_adr >= 0 ;
    wire inDev = (mem_adr <= 32'h7f0b && mem_adr >= 32'h7f00) || (mem_adr <= 32'h7f1b && mem_adr >= 32'h7f10);
    wire inTb = {mem_adr[31:2], 2'b0} == 32'h7f20;
    assign byt_dm = (acsm && inDM  && exc_code == 0) ? byteen : 0;
    assign byt_dv = (acsm && inDev && exc_code == 0) ? byteen : 0;
    assign byt_i  = (acsm && inTb  && exc_code == 0) ? byteen : 0;
    assign exc_code = syscall ? 5'd8 : acsm && (
            (width==1 && mem_adr[1:0]!=0) || (width == 2 && mem_adr[0]) || 
            !(inDM || inDev || inTb ) ||
            (save && ( inDev || {mem_adr[31:2],2'b0} == 32'h7f08 || {mem_adr[31:2],2'b0} == 32'h7f18 )) ||
            (load && (inDev || inTb))
        ) ? (save ? 5'd5 : load ? 5'd4 : 5'd0 ) :
        5'd0;

    
    CU ucum(
        .instr(M_ins),
        // output
        .memw_enable(memw_enable),
        .regw_enable(regw_enable),
        .regw_src(regw_src),
        .regw_dst(regw_dst),
        .width(width),
        .sign_ext(sign_ext),
        .save(save),
        .load(load),
        .syscall(syscall),
        .cp0_adr(cp0_adr),
        .cp0_we(cp0_we),
        .eret(eret),
        .T(T)
    );

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
        end else begin
            if (width == 1) begin
                mem_read = mem_read_raw;
            end else if (width == 2) begin
                if (mem_adr[1:0] == 2'b0) begin
                    mem_read = {16'b0 , mem_read_raw[15:0]};
                end else if (mem_adr[1:0] == 2'b10) begin
                    mem_read = {{16{1'b0}} , mem_read_raw[31:16]};
                end
            end else if (width == 3) begin
                if (mem_adr[1:0] == 2'b00) begin
                    mem_read = {{24{1'b0}} , mem_read_raw[7:0]};
                end else if (mem_adr[1:0] == 2'b01) begin
                    mem_read = {{24{1'b0}} , mem_read_raw[15:8]};
                end else if (mem_adr[1:0] == 2'b10) begin
                    mem_read = {{24{1'b0}} , mem_read_raw[23:16]};
                end else if (mem_adr[1:0] == 2'b11) begin
                    mem_read = {{24{1'b0}} , mem_read_raw[31:24]};
                end 
            end 
        end
    end

    always @* begin
        if (memw_enable && !req) begin
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

    

endmodule
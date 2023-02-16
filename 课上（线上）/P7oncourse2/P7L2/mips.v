module mips(
    input clk,                    // 时钟信号
    input reset,                  // 同步复位信号
    input interrupt,              // 外部中断信号
    output [31:0] macroscopic_pc, // 宏观 PC

    output [31:0] m_int_addr,     // 中断发生器待写入地址
    output [3 :0] m_int_byteen,   // 中断发生器字节使能信号

    output [31:0] i_inst_addr,    // IM 读取地址（取指 PC）
    input  [31:0] i_inst_rdata,   // IM 读取数据

    output [31:0] m_data_addr,    // DM 读写地址
    input  [31:0] m_data_rdata,   // DM 读取数据
    output [31:0] m_data_wdata,   // DM 待写入数据
    output [3 :0] m_data_byteen,  // DM 字节使能信号

    output [31:0] m_inst_addr,    // M 级 PC

    output w_grf_we,              // GRF 写使能信号
    output [4 :0] w_grf_addr,     // GRF 待写入寄存器编号
    output [31:0] w_grf_wdata,    // GRF 待写入数据

    output [31:0] w_inst_addr     // W 级 PC
);

    wire [31:0] br_rd, dev_adr, dev_wd, dev0_rd, dev1_rd;
    wire dev0_we, dev1_we, IRQ0, IRQ1;
    wire [3:0] br_byteen;

    CPU cpu0(
        .clk(clk),
        .reset(reset),
        .hw_int({3'b0, interrupt, IRQ1, IRQ0}),
        .macroscopic_pc(macroscopic_pc),
        
        .m_int_addr(m_int_addr),
        .m_int_byteen(m_int_byteen),

        .i_inst_addr(i_inst_addr),
        .i_inst_rdata(i_inst_rdata),
        
        .m_data_addr(m_data_addr),
        .m_data_rdata(m_data_rdata),
        .m_data_wdata(m_data_wdata),
        .m_data_byteen(m_data_byteen),
        
        .m_inst_addr(m_inst_addr),
        
        .w_grf_we(w_grf_we),
        .w_grf_addr(w_grf_addr),
        .w_grf_wdata(w_grf_wdata),

        .w_inst_addr(w_inst_addr),
        
        .br_byteen(br_byteen),
        .br_rd(br_rd)
    );


    Bridge ubr(
        .br_adr(m_data_addr),
        .br_wd(m_data_wdata),
        .br_we(|br_byteen),
        .dev0_rd(dev0_rd),
        .dev1_rd(dev1_rd),
        // output
        .br_rd(br_rd),
        .dev_adr(dev_adr),
        .dev_wd(dev_wd),
        .dev0_we(dev0_we),
        .dev1_we(dev1_we)
    );
    
    TC tc0 (
        .clk(clk),
        .reset(reset),
        .Addr(dev_adr[31:2]),
        .WE(dev0_we),
        .Din(dev_wd),
        // output
        .Dout(dev0_rd),
        .IRQ(IRQ0)
    );
    
    TC tc1 (
        .clk(clk),
        .reset(reset),
        .Addr(dev_adr[31:2]),
        .WE(dev1_we),
        .Din(dev_wd),
        // output
        .Dout(dev1_rd),
        .IRQ(IRQ1)
    );
endmodule
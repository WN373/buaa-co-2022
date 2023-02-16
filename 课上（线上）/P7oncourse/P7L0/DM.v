module DM(
    input clk,
    input reset,
    input pause, memw_enable,
    input [3:0] byteen,
    input [31:0] mem_adr, mem_write, 
    input [31:0] MPC,
    output [31:0] mem_read
);

    reg [31:0] mem_reg [0:4095];
    wire [31:0] mem_read_raw;
    wire [11:0] word_addr;

    assign word_addr = mem_adr[13:2];
    assign mem_read_raw = mem_reg[word_addr];
    assign mem_read = (byteen == 4'b1111) ? mem_read_raw :
                      (byteen == 4'b1100) ? {16'b0, mem_read_raw[31:16]} :
                      (byteen == 4'b0011) ? {16'b0, mem_read_raw[15:0]}  :
                      (byteen == 4'b1000) ? {24'b0, mem_read_raw[31:24]} :
                      (byteen == 4'b0100) ? {24'b0, mem_read_raw[23:16]} :
                      (byteen == 4'b0010) ? {24'b0, mem_read_raw[15:8]}  :
                      (byteen == 4'b0001) ? {24'b0, mem_read_raw[7:0]}   : 0;

    function RESET;
        input reset;
        integer i;
        begin
            for (i=0; i<4096; i= i+1) begin
                mem_reg[i] = 0;
            end
        end
    endfunction

    initial begin
        RESET(reset);
    end

	 
	always @(posedge clk) begin
        if (reset) begin
            RESET(reset);
        end 
        else if (memw_enable) begin
            case(byteen) 
                4'b1111: mem_reg[word_addr] = mem_write;
                4'b1100: mem_reg[word_addr][31:16] = mem_write;
                4'b0011: mem_reg[word_addr][15:0]  = mem_write;
                4'b1000: mem_reg[word_addr][31:24] = mem_write;
                4'b0100: mem_reg[word_addr][23:16] = mem_write;
                4'b0010: mem_reg[word_addr][15:8]  = mem_write;
                4'b0001: mem_reg[word_addr][7:0]   = mem_write;
                default: mem_reg[word_addr] = mem_reg[word_addr];
            endcase
            // $display("@%h: *%h <= %h",  MPC, mem_adr, mem_write);
        end
    end

endmodule
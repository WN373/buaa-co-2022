module M_DM (
    input [31:0] PC,
    input clk,
    input reset,
    input MWE,
    input [31:0] addr,
    input [31:0] MWD,
    input [1:0] DMWop,
    input [2:0] DMRop,
    output [31:0] DMout 
);
    reg [31:0] dm [0:4095];
    wire [11:0] waddr;
    integer i;

    assign waddr = addr[13:2];
    wire [31:0] rdata = dm[waddr];
    wire [31:0] wdata;
    wire [31:0] lh, lb, sw, sh, sb;    

    assign lh = (addr[1:0] < 2) ? {{16{rdata[15]}}, rdata[15:0]}
                                : {{16{rdata[31]}}, rdata[31:16]};
    
    assign lb = (addr[1:0] == 0) ? {{24{rdata[7]}}, rdata[7:0]} :
                (addr[1:0] == 1) ? {{24{rdata[15]}}, rdata[15:8]} :
                (addr[1:0] == 2) ? {{24{rdata[23]}}, rdata[23:16]}
                                 : {{24{rdata[31]}}, rdata[31:24]};
                                 
    assign DMout = (DMRop == 0) ? rdata :
                   (DMRop == 1) ? lh :
                   (DMRop == 2) ? lb : 32'd0;

    assign sw = MWD;

    assign sh = (addr[1:0] < 2) ? {rdata[31:16], MWD[15:0]}
                                : {MWD[15:0], rdata[15:0]};

    assign sb = (addr[1:0] == 0) ? {rdata[31:8], MWD[7:0]} :
                (addr[1:0] == 1) ? {rdata[31:16], MWD[7:0], rdata[7:0]} :
                (addr[1:0] == 2) ? {rdata[31:24], MWD[7:0], rdata[15:0]}
                                 : {MWD[7:0], rdata[23:0]};                        
    
    assign wdata = (DMWop == 0) ? sw :
                   (DMWop == 1) ? sh : 
                   (DMWop == 2) ? sb : sw;
    initial begin
        for(i = 0; i < 4096; i = i + 1) begin
            dm[i] <= 0;
        end
    end

    always @(posedge clk) begin
        if(reset) begin
            for(i = 0; i < 4096; i = i + 1) begin
              dm[i] <= 0;
            end
        end
        else if(MWE) begin
            dm[waddr] = wdata;
            $display("%d@%h: *%h <= %h",$time, PC, {addr[31:2], 2'b0}, wdata);
				//$display("@%h: *%h <= %h", PC, {addr[31:2], 2'b0}, wdata);
        end
    end

    
endmodule
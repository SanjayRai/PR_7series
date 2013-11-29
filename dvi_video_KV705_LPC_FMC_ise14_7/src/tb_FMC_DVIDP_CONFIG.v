// Created : 11:51:52, Tue Oct 2, 2012 : Sanjay Rai

`timescale 1ns/100fs

module tb_FMC_DVIDP_CONFIG ();

    localparam time PRD = 5;

    reg clk = 0;
    reg reset = 1;
wire SCL_OUT;
wire SDA_OUT;

    always
    begin
        clk = #(PRD/2) ~clk ;
    end

    initial 
    begin
        reset = 1;
        reset = #(2*PRD) 0;
        #(20000*PRD) $display("SImulation End!!");
    end

    FMC_DVIDP_CONFIG UUT (
            .CLK(clk), 
            .DIPSW_IN(8'hff),
            .PUSHB_IN(4'hf),
            .RESET_OUT(),
            .SCL_OUT(SCL_OUT),
            .SDA_OUT(SDA_OUT),
            .SDA_IN(1'd0)
        );


endmodule

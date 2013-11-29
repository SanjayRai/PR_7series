// Created : 13:18:43, Tue Oct 2, 2012 : Sanjay Rai

`timescale 1ns/100fs

module tb_FMC_DVIDP_CONFIG_test ();

    localparam time PRD = 10;

    reg clk = 0;
    reg reset = 1;
    wire [7:0] count;

    always
    begin
        clk = #(PRD/2) ~clk ;
    end

    initial 
    begin
        $monitor ("At Time = %t, Count = %d", $time, count);
        reset = 1;
        reset = #(200*PRD) 0;
        #(200*PRD) $display("SImulation End!!");
    end

    FMC_DVIDP_CONFIG_test UUT (
            .reset(reset),
            .clk(clk),
            .count(count)
        );


endmodule

`timescale 1ns/1ps
module sar_tb();
  localparam CLK_PERIOD = 20.0;
  wire CLKC;
  reg CLKS,D_GND,outn,valid,rstn;
  sar x1(CLKS,D_GND,valid,outn,CLK10,CLK9,CLK8,CLK7,CLK6,CLK5,CLK4,CLK3,CLK2,CLK1,CLKC,D9,D8,D7,D6,D5,D4,D3,D2,D1,D0);
  
    initial begin
    CLKS = 0;
     forever #(CLK_PERIOD/2.0)
     CLKS = ~ CLKS;
   end
   
   initial begin
    rstn = 0;
     forever #(CLK_PERIOD/20.0)
     rstn = ~ rstn;
   end

    initial begin
    outn = 0;
     forever #(CLK_PERIOD/6.0)
     outn = ~ outn;
   end   
   
   initial begin
    valid = 1;
    forever #(CLK_PERIOD/40.0) valid =~ valid;
  end
   initial begin
     D_GND = 1;
        rstn= 1'b1;
  end
  
endmodule

    
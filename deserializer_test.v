/*************************************************************
Design Name 	: Deserializer
File Name   	: deserializer.v
Function    	: Implementation of 1:8 Deserializer
Programer     	: Thomas Chou
Last Modified	: 07-07-2020
*************************************************************/
module deserializer_tb();

reg clk;
reg datain;
reg validIn;

wire [7:0] dataout;
wire validOut;


deserializer dut(.clk(clk), .datain(datain), .validIn(validIn), .dataout(dataout), .validOut(validOut));

initial
	begin
		clk = 1'b0;
		forever #5 clk = ~clk;
	end

	
initial
	begin
		#10;
		validIn = 1'b1;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b1;
		#10;
		
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		
		datain = 1'b0;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b1;
		#10;
		
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		
		datain = 1'b1;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b0;
		#10;
		
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		datain = 1'b0;
		#10;
		datain = 1'b1;
		#10;
		
		validIn <= 1'b0;
		#500;
		$finish;
	end
	
endmodule 
/*************************************************************
Design Name 	: Deserializer
File Name   	: deserializer.v
Function    	: Implementation of 1:8 Deserializer
Programer     	: Thomas Chou
Last Modified	: 07-07-2020
*************************************************************/

module deserializer(clk, datain, validIn, dataout, validOut);

input clk;
input datain;
input validIn;

output reg [7:0] dataout;
output reg validOut;

reg [7:0] temp;


always @(posedge clk)
	begin
		if(validIn == 1'b1)
			begin
				validOut <= 1'b0;
				temp[6:0] <= temp[7:1];
				temp[7] <= datain;
			end
		else
			begin
				validOut <= 1'b1;
			end
	end
	
always @(posedge clk)
	begin
		if(validOut == 1'b0)
			begin
				dataout <= 8'b0;
			end
		else
			begin
				dataout <= temp;
			end
	end
endmodule 
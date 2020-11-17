/*************************************************************
Design Name 	: serializer
File Name   	: serializer.v
Function    	: Implementation of 8:1 Serializer
Programer     	: Thomas Chou
Last Modified	: 07-07-2020
*************************************************************/
module serializer(clk, datain, validIn, dataout, validOut);

input clk;
input [31:0] datain;
input validIn;

output reg dataout;
output reg validOut;

reg [31:0] tmp;
reg [5:0] count = 0;


always @(posedge clk)
	begin
		if(validIn == 1'b1)
			begin
				validOut <= 1'b0;
				tmp <= datain;
			end
		else
			begin
				validOut <= 1'b1;
				tmp <= (tmp >> 1);
			end
	end

always @(posedge clk)
	begin
		if(validOut == 1'b0 || count == 6'b100001)
			begin
				dataout <= 1'b0;
				count <= 6'b000000;
			end
		else
			begin
				dataout <= tmp[0];
				count <= count + 1'b1;
			end
	end
	
endmodule 
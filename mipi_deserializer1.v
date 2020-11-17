`timescale 1ps/100fs

/*************************************************************
Design Name 	: Deserializer
File Name   	: deserializer.v
Function    	: Implementation of 1:8 Deserializer
Programer     	: Thomas Chou
Last Modified	: 07-07-2020
*************************************************************/

module deserializer(RxDDRClkHS, DRXHSP, HS_DESER_EN, HSRX_DATA, SYNC);

// inputs
parameter               WIDTH=8;
input                   RxDDRClkHS;  // half-rate clock, from RX clock lane.
input                   HS_DESER_EN; // "pay attension to incoming serial!"
input                   DRXHSP;      // 1-bit serial input.

// outputs
output [WIDTH-1:0]      HSRX_DATA;    // byte of deserialized data.
output                  SYNC;



reg [7:0] temp;


always @(posedge RxDDRClkHS)
	begin
		if(HS_DESER_EN == 1'b1)
			begin
				SYNC <= 1'b0;
				temp[6:0] <= temp[7:1];
				temp[7] <= DRXHSP;
			end
		else
			begin
				SYNC <= 1'b1;
			end
	end
	
always @(posedge RxDDRClkHS)
	begin
		if(SYNC == 1'b0)
			begin
				HSRX_DATA <= 8'b0;
			end
		else
			begin
				HSRX_DATA <= temp;
			end
	end
endmodule 
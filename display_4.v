`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:39 12/29/2024 
// Design Name: 
// Module Name:    display_4 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module display_4(
    input [7:0] C1,
	 input [7:0] C2,
	 input [7:0] C3,
	 input [7:0] C4,

	 input sclk,
	 output reg [4:0] number,
	 output reg [3:0] display
    );
	 
	 reg [4:0] counter;
	 
	 wire [2:0] B1 = C1[7:5];
	 wire [2:0] B2 = C2[7:5];
	 wire [2:0] B3 = C3[7:5];
	 wire [2:0] B4 = C4[7:5];
	 
	 wire [4:0] DSP1 = C1[4:0];
	 wire [4:0] DSP2 = C2[4:0];
 	 wire [4:0] DSP3 = C3[4:0];
	 wire [4:0] DSP4 = C4[4:0];

	 
	 initial begin

	 end
always @ (posedge sclk)  //now pwm clock
	begin
		counter = counter +1;
		case(counter[4:3])
		0:begin
			display[0] = 0;
			display[1] = 1;
			display[2] = 1;
			display[3] = 1;
			if(counter[2:0]<B1)
				number = DSP1;
			else
				number = 26; //off
		end
		1:begin
			display[0] = 1;
			display[1] = 0;
			display[2] = 1;
			display[3] = 1;
			if(counter[2:0]<B2)
				number = DSP2;
			else
				number = 26; //off
		end
		2:begin
			display[0] = 1;
			display[1] = 1;
			display[2] = 0;
			display[3] = 1;
			if(counter[2:0]<B3)
				number = DSP3;
			else
				number = 26; //off
		end
		3:begin
			display[0] = 1;
			display[1] = 1;
			display[2] = 1;
			display[3] = 0;
			if(counter[2:0]<B4)
				number = DSP4;
			else
				number = 26; //off
			if(counter==4'b1111)
				counter = 0;
		end
	endcase
	end
endmodule
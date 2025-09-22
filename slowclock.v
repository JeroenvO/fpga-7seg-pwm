`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:21 12/29/2024 
// Design Name: 
// Module Name:    slowclock 
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
module slowclock(
    input fast_clock,
    input [1:0] speed_up,
	 //output reg slow_clock,
	 output reg slower_clock,
	 output reg pwm_clock
    );
	//parameter WAITTIME =  50000;  //multiplex
	parameter WAITTIME2 = 8000000;  
	parameter WAITTIME3 = 6250; // with input 50Mhz, 6250 is 8kHz, perfect for display.

	//reg [31:0]counter;
	reg [31:0]counter2;
	reg [31:0]counter3;

	initial
	begin
		//slow_clock = 1;
		slower_clock = 1;
		pwm_clock = 1;
	//	counter = 0;
		counter2=0;
		counter3=0;
	end

	always@(posedge fast_clock)
	begin
	/*	counter = counter + 1;
		if(counter > WAITTIME)
		begin
			slow_clock = ~slow_clock;  //multiplex
			counter = 0;
		end
		*/
		counter2 = counter2 + 1;
		if(counter2 > (WAITTIME2>>speed_up) )
		begin
			slower_clock = ~slower_clock;
			counter2 = 0;
		end
		
		
		counter3 = counter3 + 1;
		if(counter3 > WAITTIME3 )
		begin
			pwm_clock = ~pwm_clock;
			counter3 = 0;
		end
	end
endmodule
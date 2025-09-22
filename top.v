`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:47:00 12/29/2024 
// Design Name: 
// Module Name:    top 
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
module top(
    output [3:0] display_select,
    output reg [15:0] led_bar,
    input [5:0] sw,
    input clk_50mhz,
    //input clk_125mhz,
    output [7:0] display_segments
    );
	 //wire slow_clock;
	 wire slower_clock;
	 wire pwm_clock;
	reg [4:0] counter_bar;
	wire [4:0] number;  // the current number displayed from display4
   reg [4:0] display_string[32:0]; //  = {13,0,14,15,16,17,18,19,20,17,18,1,0,14,21,22}; //congratulations
	reg [7:0] dance_string[32:0]; // 
	reg [4:0] i_display = 0;
	reg [1:0] speed_up = 0;
	reg [7:0] C1;
	reg [7:0] C2;
	reg [7:0] C3;
	reg [7:0] C4;
	reg [7:0] B; // temp var for brightness
	reg [2:0] show_index; // different shows index
	//*/
	
	
	initial begin
		counter_bar=0;
		led_bar = 0;
		show_index = 0;
//	display_string[0]=13;
//	display_string[1]=0;
//	display_string[2]=14;
//	display_string[3]=15;
//	display_string[4]=16;
//	display_string[5]=17;
//	display_string[6]=18;
//	display_string[7]=19;
//	display_string[8]=20;
//	display_string[9]=17;
//	display_string[10]=18;
//	display_string[11]=1;
//	display_string[12]=0;
//	display_string[13]=14;  //
//	display_string[14]=21;  // S.
//	display_string[15]=22;  // .
//	display_string[16]=22;
//	display_string[17]=22;


	display_string[0]=26;
	display_string[1]=26;
	display_string[2]=26;
	display_string[3]=13;
	display_string[4]=0;
	display_string[5]=14;
	display_string[6]=15;
	display_string[7]=16;
	display_string[8]=17;
	display_string[9]=18;
	display_string[10]=19;
	display_string[11]=20;
	display_string[12]=17;
	display_string[13]=18;
	display_string[14]=1;
	display_string[15]=0;
	display_string[16]=14;  //
	display_string[17]=21;  // S
	display_string[18]=26;  // .
	display_string[19]=26;
	display_string[20]=26;
	display_string[21]=26;
	
	dance_string[0] = 11+(3<<5);
	dance_string[1] = 23+(7<<5);
	dance_string[2] = 24+(7<<5);
	dance_string[3] = 10+(3<<5);

	end
	
	slowclock SC1(
		.fast_clock(clk_50mhz),
		.speed_up(speed_up),
		//.slow_clock(slow_clock),
		.slower_clock(slower_clock),
		.pwm_clock(pwm_clock)
		);

	display_1 DP1(
		 .number(number),
		 .clk(pwm_clock),
		 .a(display_segments[0]),
		 .b(display_segments[1]),
		 .c(display_segments[2]),
		 .d(display_segments[3]),
		 .e(display_segments[4]),
		 .f(display_segments[5]),
		 .g(display_segments[6]),
		 .dp(display_segments[7])
		);
		
		/*
		display_4 DP4(
		 .DSP1(display_string[i_display]),
		 .DSP2(display_string[i_display+1]),
	    .DSP3(display_string[i_display+2]),
	    .DSP4(display_string[i_display+3]),
		 .B1(1), // brightness
		 .B2(3),
		 .B3(5),
		 .B4(7),
	    .sclk(pwm_clock),  //multiplex
	    .number(number),
	    .display(display_select)
		);
		*/
		display_4 DP4(
		 .C1(C1),
		 .C2(C2),
	    .C3(C3),
	    .C4(C4),
	    .sclk(pwm_clock),  //multiplex
	    .number(number),
	    .display(display_select)
		);
	
	//pattern congratulations text from display_string
	always@(posedge slower_clock)
	begin
		

			case(show_index)
			0: begin
				if (i_display == 25) begin
					i_display=0;
				end else if (i_display==0)begin
					led_bar = 0;
				end
				i_display = i_display+1;  // shift the letters one up

				// set the display
				if (i_display<8) begin
					C1 = 28 + (i_display << 5);
					C2 = 26;
					C3 = 26;
					C4 = 29 + (i_display << 5);
					if(i_display>4)begin
					led_bar[1]=1;
					led_bar[14]=1;
					end
					led_bar[0]=1;
					led_bar[15]=1;
				end else if (i_display<12) begin
					C1 = 25 + (7 << 5);
					C2 = 28 + (i_display << 6);
					C3 = 29 + (i_display << 6);
					C4 = 25 + (7 << 5);	
					led_bar[2]=1;
					led_bar[13]=1;
					if (i_display>10) begin
						led_bar[3]=1;
						led_bar[12]=1;
					end
				end else if (i_display<16) begin
					C1 = 25 + (7 << 5);
					C2 = 25 + (7 << 5);
					C3 = 25 + (7 << 5);
					C4 = 25 + (7 << 5);	
					led_bar[4]=1;
					led_bar[11]=1;
					if(i_display>14)begin
					led_bar[5]=1;
					led_bar[10]=1;
					end
				end else if (i_display<20) begin
					i_display = 0;
					speed_up=0;
					counter_bar=0;
					led_bar=0;
					show_index = show_index+1;
					end
			end  //endcase
			1: begin
				speed_up=1;
				C1 = dance_string[(i_display)%4];
				C2 = dance_string[(i_display+1)%4];
				C4 = dance_string[(i_display+2)%4];
				C3 = dance_string[(i_display+3)%4];
	
				if (i_display==0)begin
				led_bar = 16'b1010101010101010;
				end
				i_display=i_display+1;
				led_bar = ~led_bar;
				if (i_display > 30) begin
					show_index=show_index+1;
					speed_up=0;
					counter_bar=0;
					led_bar = 0;
					end
			end  //endcase
			3: begin	
				B = 7 << 5; // brightness
				C1 = display_string[i_display] + B;
				C2 = display_string[i_display+1] + B;
				C3 = display_string[i_display+2] + B;
				C4 = display_string[i_display+3] + B;
				if(counter_bar<16)begin
					led_bar[counter_bar] = ~led_bar[counter_bar];
					counter_bar = counter_bar+1;
				end
				if (i_display == 18) begin
						i_display=0;
						counter_bar=0;
						if (speed_up == 2) begin
							speed_up = 0;
							show_index=show_index+1;
						end else begin
							speed_up = speed_up+1;
						end
				end else begin
					i_display = i_display+1;  // shift the letters one up
				end
				
			end
			4: begin
				show_index = 0;
				led_bar =0;
				i_display = 0;
				counter_bar=0;
			end
			default: begin
				show_index = show_index+1;
				led_bar =0;
				i_display = 0;
				counter_bar=0;
				C1=26;
				C2=26;
				C3=26;
				C4=26;
			end
		endcase
	end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:28 12/29/2024 
// Design Name: 
// Module Name:    display_1 
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
module display_1(
 
    input [4:0] number,
	 input clk,
	 output reg a,
	 output reg b,
	 output reg c,
	 output reg d,
	 output reg e,
	 output reg f,
	 output reg g,
	 output reg dp

    );
	 //initial begin
	 //dp = 0;
	 //end
	 
always @ (posedge clk)
begin
	case(number)
	0:
		begin
		a=1;
		b=1;
		c=1;
		d=1;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	1:
		begin
		a=0;
		d=0;
		e=0;
		f=0;
		g=0;
		b=1;
		c=1;
		dp=0;
		end
	2:
		begin
		a=1;
		b=1;
		g=1;
		d=1;
		e=1;
		f=0;
		c=0;
		dp=0;
		end
	3:
		begin
		a=1;
		f=0;
		g=1;
		e=0;
		d=1;
		b=1;
		c=1;
		dp=0;
		end
	4:
		begin
		f=1;
		g=1;
		b=1;
		c=1;
		e=0;
		d=0;
		a=0;
		dp=0;
		end
	5:
		begin
		a=1;
		c=1;
		d=1;
		f=1;
		g=1;
		b=0;
		e=0;
		dp=0;
		end
	6:
		begin
		a=1;
		f=1;
		e=1;
		d=1;
		c=1;
		g=1;
		b=0;
		dp=0;
		end
	7:
		begin
		a=1;
		b=1;
		c=1;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=0;
		end	
	8:
		begin
		a=1;
		b=1;
		c=1;
		d=1;
		e=1;
		f=1;
		g=1;
		dp=0;
		end
	9:
		begin
		a=1;
		b=1;
		c=1;
		d=1;
		f=1;
		g=1;
		e=0;
		dp=0;
		end
	10: //hoog streepje
		begin
		a=1;
		b=0;
		c=0;
		d=0;
		f=0;
		g=0;
		e=0;
		dp=0;
		end
	11: //laag streepje
		begin
		a=0;
		b=0;
		c=0;
		d=1;
		f=0;
		g=0;
		e=0;
		dp=0;
		end
	12: //middden
		begin
		a=0;
		b=0;
		c=0;
		d=0;
		f=0;
		g=1;
		e=0;
		dp=0;
		end
	13: // C
		begin
		a=1;
		b=0;
		c=0;
		d=1;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	14: // N
		begin
		a=1;
		b=1;
		c=1;
		d=0;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	15: // N
		begin
		a=1;
		b=0;
		c=1;
		d=1;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	16: // r
		begin
		a=1;
		b=0;
		c=0;
		d=0;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	17: // A
		begin
		a=1;
		b=1;
		c=1;
		d=0;
		e=1;
		f=1;
		g=1;
		dp=0;
		end
	18: // T
		begin
		a=1;
		b=1;
		c=1;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=0;
		end
	19: // U
		begin
		a=0;
		b=1;
		c=1;
		d=1;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	20: // L
		begin
		a=0;
		b=0;
		c=0;
		d=1;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	21: // S
		begin
		a=1;
		b=0;
		c=1;
		d=1;
		e=0;
		f=1;
		g=1;
		dp=0;
		end
	22: // .
		begin
		a=0;
		b=0;
		c=0;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=1;
		end
	23: // bottom o
		begin
		a=0;
		b=0;
		c=1;
		d=1;
		e=1;
		f=0;
		g=1;
		dp=0;
		end
	24: // top o
		begin
		a=1;
		b=1;
		c=0;
		d=0;
		e=0;
		f=1;
		g=1;
		dp=0;
		end
	25: // ||
	begin
		a=0;
		b=1;
		c=1;
		d=0;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	26: // off
	begin
		a=0;
		b=0;
		c=0;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=0;
		end
	27: // exclamation mark
	begin
		a=0;
		b=1;
		c=1;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=1;
		end
	28: // left
	begin
		a=0;
		b=0;
		c=0;
		d=0;
		e=1;
		f=1;
		g=0;
		dp=0;
		end
	29: // right
	begin
		a=0;
		b=1;
		c=1;
		d=0;
		e=0;
		f=0;
		g=0;
		dp=0;
		end
	
	default:
		begin
		a=1;
		b=1;
		c=1;
		d=1;
		e=1;
		f=1;
		g=1;
		dp=1;
		end
	endcase

end
endmodule
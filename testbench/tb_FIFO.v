`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/06 20:01:57
// Design Name: 
// Module Name: tb_FIFO
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_FIFO();

	reg		reset, io_In_HS_Req;
	reg		[7:0] io_In_Data;
	wire	[7:0] io_Out_Data;

FIFO	uut(
	0,
	reset,
	io_In_HS_Req,
	io_In_HS_Ack,
	io_In_Data,
	io_Out_HS_Req,
	io_Out_HS_Ack,
	io_Out_Data
);

	initial begin
	reset = 0;
	io_In_HS_Req = 0;
	io_In_Data = 0;
	#100;
	reset = 1;
	#100;
	reset = 0;
	#100;
	repeat(16)
		begin
		io_In_HS_Req = ~io_In_HS_Req;
		io_In_Data = $random;
		#100;
		if((io_In_HS_Req==io_Out_HS_Req)&&(io_In_Data==io_Out_Data))
			$display("Test successed!");
		else
			$display("Test failed!");
		end
	end

	assign #5 io_Out_HS_Ack = io_Out_HS_Req;

endmodule

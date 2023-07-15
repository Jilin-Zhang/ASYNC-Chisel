`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/06 19:46:52
// Design Name: 
// Module Name: tb_Accumulate
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


module tb_Accumulate();

	reg		reset, io_In_HS_Req;
	reg		[7:0]  io_In_Data;
	wire	io_In_HS_Ack;
	wire	[15:0] io_Out_Data;
	
	reg		[15:0]	AccuData;

Accumulate	uut(
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
	AccuData = 0;
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
		AccuData = AccuData + io_In_Data;
		end
	#100;
	if(io_Out_Data == AccuData)
		$display("Test successed!");
	end

	assign	#5 io_Out_HS_Ack = io_Out_HS_Req;
endmodule

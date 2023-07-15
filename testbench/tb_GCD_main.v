`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/06 22:39:31
// Design Name: 
// Module Name: tb_GCD_main
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


module tb_GCD_main();

	reg				reset, io_In_HS_Req;
	reg		[7:0] 	io_In_Data_A, io_In_Data_B;
	wire	[7:0]	io_Out_Data_A, io_Out_Data_B;

GCD_main	uut(
	0,
	reset,
	io_In_HS_Req,
	io_In_HS_Ack,
	io_In_Data_A,
	io_In_Data_B,
	io_Out_HS_Req,
	io_Out_HS_Ack,
	io_Out_Data_A,
	io_Out_Data_B
);

	initial begin
	reset = 0;
	io_In_HS_Req = 0;
	io_In_Data_A = 0;
	io_In_Data_B = 0;
	#100;
	reset = 1;
	#100;
	reset = 0;
	#100;
	io_In_HS_Req = ~io_In_HS_Req;
	io_In_Data_A = 15;
	io_In_Data_B = 5;
	#100;
	io_In_HS_Req = ~io_In_HS_Req;
	io_In_Data_A = 21;
	io_In_Data_B = 7;
	#100;
	io_In_HS_Req = ~io_In_HS_Req;
	io_In_Data_A = 81;
	io_In_Data_B = 36;
	#100;
	io_In_HS_Req = ~io_In_HS_Req;
	io_In_Data_A = 72;
	io_In_Data_B = 36;
	#100;
	end

	assign #5 io_Out_HS_Ack = io_Out_HS_Req;

endmodule

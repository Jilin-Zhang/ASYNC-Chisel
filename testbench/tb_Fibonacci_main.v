`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/06 22:55:24
// Design Name: 
// Module Name: tb_Fibonacci_main
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


module tb_Fibonacci_main();

	reg				reset, io_Go;
	wire	[7:0]	io_Out_Data;

Fibonacci_main		uut(
	0,
	reset,
	io_Out_HS_Req,
	io_Out_HS_Ack,
	io_Out_Data,
	io_Go
);

	initial begin
	reset = 0;
	io_Go = 0;
	#100;
	reset = 1;
	#100;
	reset = 0;
	#100;
	io_Go = 1;
	end

	assign #5 io_Out_HS_Ack = io_Out_HS_Req;
endmodule

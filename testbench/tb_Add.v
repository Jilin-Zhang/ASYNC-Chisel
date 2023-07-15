`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/06 19:54:04
// Design Name: 
// Module Name: tb_Add
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


module tb_Add();

	reg					reset, io_In0_HS_Req, io_In1_HS_Req;
	reg			[7:0] 	io_In0_Data, io_In1_Data;
	wire		[7:0] 	io_Out_Data;

Add		uut(
	0,
	reset,
	io_In0_HS_Req,
	io_In0_HS_Ack,
	io_In0_Data,
	io_In1_HS_Req,
	io_In1_HS_Ack,
	io_In1_Data,
	io_Out_HS_Req,
	io_Out_HS_Ack,
	io_Out_Data
);

	initial begin
	reset = 0;
	io_In0_HS_Req = 0;
	io_In1_HS_Req = 0;
	io_In0_Data = 0;
	io_In1_Data = 0;
	#100;
	reset = 1;
	#100;
	reset = 0;
	#100;
	repeat(16)
		begin
		io_In0_HS_Req = ~io_In0_HS_Req;
		io_In1_HS_Req = ~io_In1_HS_Req;
		io_In0_Data = $random;
		io_In1_Data = $random;
		#100;
		if(io_Out_Data == (io_In0_Data+io_In1_Data))
			$display("Test successed!");
		else
			$display("Test failed!");
		end
	end
	
	assign	#5 io_Out_HS_Ack = io_Out_HS_Req;

endmodule

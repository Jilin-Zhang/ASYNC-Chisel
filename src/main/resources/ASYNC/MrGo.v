
module MrGo(
	input	wire	fire,
	input	wire	En,
	output	wire	Out
);

	wire	NAND0, NAND1;

	assign  NAND0 = ~(fire & NAND1);
	assign  NAND1 = ~(En & NAND0);

	assign  Out = ~NAND0;

endmodule

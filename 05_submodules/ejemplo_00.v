module ejemplo_00 (
	input A, B, C, D,
	output Y
	);

	assign Y = (~A & ~B & C) | D;
	
endmodule	

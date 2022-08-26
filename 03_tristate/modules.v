
module tristate (a,en, y);
	input a;
	input en;
	output y;
	
	assign y = en? a:1'bz;
	
endmodule
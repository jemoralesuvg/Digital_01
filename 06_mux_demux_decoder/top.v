// se configuraron como pullups las entradas en pins.pcf
/*
module top (
	input  PIN_10, PIN_13,
	output PIN_14
);
	// negamos las entradas para cambiar el estado de los pines pull-up
	MUX_4x1 U1 ( 1'b0, 1'b0, 1'b0, 1'b1, ~PIN_13, ~PIN_10, PIN_14);
	
endmodule
*/

/*
module top (
	input PIN_7, PIN_10, PIN_13,
	output PIN_14, PIN_17, PIN_20, PIN_23
);
	
	wire [1:0] sel;
	wire [3:0] out;
	
	
	DEMUX_1x4 U1 ( sel, ~PIN_7, out);
	
	assign sel = {~PIN_13, ~PIN_10};
	assign out = {PIN_14, PIN_17, PIN_20, PIN_23};
	
endmodule
*/

module top (
	input PIN_10, PIN_13, PIN_7,
	output PIN_14, PIN_17, PIN_20, PIN_23
);
	
	wire [1:0] sel;
	wire [3:0] out;
	
	
	DECODER_2x4 U1 ( sel, out);
	
	assign sel = {~PIN_13, ~PIN_10};
	assign out = {PIN_14, PIN_17, PIN_20, PIN_23};
	
endmodule
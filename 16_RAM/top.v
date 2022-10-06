module top (
	input PIN_1, PIN_2, PIN_3, PIN_4,
	 PIN_7, PIN_8, PIN_9, PIN_10,
	 PIN_13, PIN_14, PIN_16,
	output PIN_21, PIN_22, PIN_23, PIN_24, 
	 LED, PIN_20
);
	wire [3:0] address = {~PIN_10, ~PIN_9, ~PIN_8, ~PIN_7};
	wire [3:0] data_in = {~PIN_4, ~PIN_3, ~PIN_2, ~PIN_1};
	wire [3:0] data_out = {PIN_21, PIN_22, PIN_23, PIN_24};
	wire cs, we, clk;
	assign cs = ~PIN_14;
	assign we = ~PIN_16;
	assign clk = ~PIN_13;
	assign PIN_20 = we & cs;
	assign clk = LED;
	
	RAM mem0 (clk, cs, we, address, data_in, data_out);
	
endmodule

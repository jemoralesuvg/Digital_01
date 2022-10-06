module top (
	input PIN_1, PIN_2, PIN_3, PIN_4,
	input PIN_7, PIN_8, PIN_9, PIN_10,
	output PIN_21, PIN_22, PIN_23, PIN_24
);
	wire [7:0] address = {~PIN_10, ~PIN_9, ~PIN_8, ~PIN_7,
		~PIN_4, ~PIN_3, ~PIN_2, ~PIN_1};
	wire [3:0] data = {PIN_21, PIN_22, PIN_23, PIN_24};
	
	ROM mem0 (address, data);
	
endmodule

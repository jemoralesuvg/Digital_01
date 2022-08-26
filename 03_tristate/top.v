// look in pins.pcf for all the pin names on the TinyFPGA BX board
// Si estuviera en otro folder el modulo puede usar `include "folder/modules.v" 

module top (
	input PIN_13, PIN_10, PIN_7,
	output PIN_14,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;
	
	wire data_bus;
	wire select;
	wire a;
	wire b;
	
	tristate tri01 (a, select, data_bus);
	tristate tri02 (b, ~select, data_bus);
	
	assign PIN_14 = data_bus;
	assign select = PIN_7;
	assign a = PIN_10;
	assign b = PIN_13;
	
	
endmodule

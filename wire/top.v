// look in pins.pcf for all the pin names on the TinyFPGA BX board


module top (
	input PIN_13, PIN_10,
	output PIN_14, PIN_16, PIN_7,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;
	
	assign LED = PIN_13;
	assign PIN_14 = ~PIN_13;
	assign PIN_16 = PIN_13 & PIN_10;
	
endmodule

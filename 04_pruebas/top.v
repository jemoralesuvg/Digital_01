
// busca en el archivo PINS.PCF todos los nombres de los pines
// pullup en PIN_13
// pullup en PIN_10

// circuito: 
// pushbuttons en pines 10 y 13
// LEDS en 14 y 16

module top (
	input PIN_13, PIN_10,
	output PIN_14, PIN_17, PIN_20, PIN_23,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;
	
	assign LED = 1'b0;
	assign PIN_14 = PIN_13;
	assign PIN_17 = ~PIN_13;
	assign PIN_20 = PIN_10;
	assign PIN_23 = ~PIN_10;
	
endmodule

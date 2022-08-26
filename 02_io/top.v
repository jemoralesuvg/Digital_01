
// busca en el archivo PINS.PCF todos los nombres de los pines
// pullup en PIN_13
// pullup en PIN_10

// circuito: 
// pushbuttons en pines 10 y 13
// LEDS en 14 y 16

module top (
	input PIN_13, PIN_10,
	output PIN_14, PIN_16,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;
	
	assign LED = PIN_13;
	assign PIN_14 = ~PIN_13;
	assign PIN_16 = PIN_13 & PIN_10;
	
endmodule

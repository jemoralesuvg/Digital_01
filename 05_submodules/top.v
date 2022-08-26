// se configuraron como pullups las entradas en pins.pcf
module top (
	input PIN_4, PIN_7, PIN_10, PIN_13,
	output PIN_14, PIN_16,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;
	// asignación de una constante de 1 bit definido en binario
	assign LED = 1'b0;
	// negamos las entradas para cambiar el estado de los pines pull-up
	// modulo invocando nombres de los pines
	ejemplo_00 U1 ( .A(~PIN_4), .B(~PIN_7), .C(~PIN_10), .D(~PIN_13), .Y(PIN_14));
	// modulo invocando por orden de los pines
	ejemplo_00 U2 ( ~PIN_4), ~PIN_7, ~PIN_10, ~PIN_13, PIN_16);
	
endmodule

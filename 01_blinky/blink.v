//------------------------------------------------------------------
//-- Blinking LED
//------------------------------------------------------------------

module Test (
  input CLK,    // Reloj de 16MHz en la placa
    output LED,   // La LED en la placa
    output USBPU  // USB pull-up resistor
);

  // Lo ponemos en cero para no usar su módulo interno de USB
  assign USBPU = 0;

  reg [24:0] counter = 0;

  always @(posedge CLK) 
    counter <= counter + 1; 
	// cuenta a 16MHz

  assign LED = counter[24];
	// el bit 24 es equivalente a 16,777,216
	// Esto nos daría un cambio aproximado cada segundo

endmodule

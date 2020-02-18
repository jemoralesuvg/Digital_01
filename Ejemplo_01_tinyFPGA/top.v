// look in pins.pcf for all the pin names on the TinyFPGA BX board
//`timescale 1 ns / 1 ps

module top (
    input PIN_1, PIN_3,    // 16MHz clock
    output PIN_10);
//output USBPU  // USB pull-up resistor
    logic PIN_1, PIN_3;
    logic PIN_10;

    //assign USBPU = 0;
    always @ (PIN_1 or PIN_3)
      PIN_10 = PIN_1 & PIN_3;

endmodule

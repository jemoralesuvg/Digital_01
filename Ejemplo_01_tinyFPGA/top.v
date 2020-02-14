// look in pins.pcf for all the pin names on the TinyFPGA BX board
//`timescale 1 ns / 1 ps

module top (
    input PIN_1, PIN_3,    // 16MHz clock
    output PIN_10);
//output USBPU  // USB pull-up resistor

    //assign USBPU = 0;
    assign PIN_10 = PIN_1 & PIN_3;

endmodule

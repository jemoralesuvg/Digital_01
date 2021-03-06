// look in pins.pcf for all the pin names on the TinyFPGA BX board

module top (
    input PIN_1, PIN_2, PIN_3, PIN_4,
    output PIN_14, PIN_15, PIN_16, PIN_17, PIN_18, PIN_19, PIN_20);

    wire [3:0] in;
    wire [6:0] out;

    assign {PIN_1, PIN_2, PIN_3, PIN_4} = in;
    assign {PIN_14, PIN_15, PIN_16, PIN_17, PIN_18, PIN_19, PIN_20} = out;

    seven_seg sev (in, out);

endmodule

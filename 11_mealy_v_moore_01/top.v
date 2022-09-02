// look in pins.pcf for all the pin names on the TinyFPGA BX board
// apply pull-ups to pins on pins.pcf -pullup yes

module top (
    input CLK,    // 16MHz clock
	input PIN_6, PIN_23, 
	output PIN_1, PIN_2,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 1'b0;
	
    wire A, Y0, Y1, reset, clk;
	assign A = ~PIN_23;
	assign reset = PIN_6;
	
	assign Y0 = PIN_1;
	assign Y1 = PIN_2;
	
	assign clk = counter[25];
	
    mealy_01 mealy(A, clk, reset, Y0);
    moore_01 moore(A, clk, reset, Y1);

    // keep track of time and location in blink_pattern
    reg [25:0] counter;

    // increment the blink_counter every clock
    always @(posedge CLK) begin
        counter <= counter + 1;
    end
    
    // light up the LED according to the pattern
    assign LED = clk;
	
endmodule

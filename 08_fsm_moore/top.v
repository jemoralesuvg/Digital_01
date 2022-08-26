// look in pins.pcf for all the pin names on the TinyFPGA BX board
// apply pull-ups to pins on pins.pcf -pullup yes

module top (
    input CLK,    // 16MHz clock
	input PIN_14, PIN_17, 
	output PIN_1, PIN_2, PIN_3, PIN_10, PIN_11, PIN_12,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 1'b0;
	
    wire TA, TB, clk, reset;
    wire [2:0] LA, LB;
	
	assign TA = PIN_17;
	assign TB = PIN_14;
	assign reset = 1'b0;
	
	assign LA = {PIN_1,PIN_2, PIN_3};
	assign LB = {PIN_10,PIN_11, PIN_12};
	
	assign clk = counter[25];
	
	
    semaforo_completo U1(TA, TB, clk, LA, LB);

    // keep track of time and location in blink_pattern
    reg [25:0] counter;

    // increment the blink_counter every clock
    always @(posedge CLK) begin
        counter <= counter + 1;
    end
    
    // light up the LED according to the pattern
    assign LED = clk;
	
endmodule

module top(
  input CLK, PIN_14, PIN_17,   // 16MHz clock
  output PIN_1, PIN_3, LED   // LED de salida
);
    reg [24:0] counter = 0;
    always @(posedge CLK) 
        counter <= counter + 1;
		
    assign LED = counter[24];
    assign PIN_3 = PIN_17;
    
    FFD_R u0 (.D(PIN_17), .clk(counter[24]), .reset(~PIN_14), .Q(PIN_1));
endmodule

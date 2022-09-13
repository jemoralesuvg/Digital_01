module tmr(input clk, reset, output reg [7:0] count);
    
    // funcionamiento del timer
    always @ (posedge clk or posedge reset) begin

        if (reset == 1)
            count <= 8'b0;
        else
            count <= count + 1;
    end
	// condición inicial de simulación
	initial count <= 8'b0;
	
endmodule

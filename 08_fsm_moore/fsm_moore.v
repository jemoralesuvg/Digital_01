 module FSM_moore(input TA, TB, clk, reset, output [1:0] LA, LB);
    wire [1:0] next_state, LA, LB;	// combinacional
	reg [1:0] state;		// secuencial
    
    // Nube combinacional para calcular el estado futuro
	assign next_state[1] = state[1] ^ state[0];
	assign next_state[0] = (~state[1] & ~state[0] & ~TA) | (state[1] & ~state[0] & ~TB);

    // Banco de flip flops
    always @ (posedge clk or posedge reset) begin

        if (reset == 1)
            state <= 2'b00;
        else
            state <= next_state;
    end

	// valor inicial para la simulación
	// se puede obviar si usamos el reset
	initial state <= 2'b00;
	
    // Nube combinacional para calcular las salidas
    // 00 = green		01 = yellow		10 == red
	assign LA[1] = state[1];
	assign LA[0] = ~state[1]&state[0];
	assign LB[1] = ~state[1];
	assign LB[0] = state[1]&state[0];
	
endmodule

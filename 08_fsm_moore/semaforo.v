module semaforo_completo (
	input TA, TB, clk,
	output [2:0] LA, LB
	);
    wire [2:0] LA, LB;		// decodificada
	wire [1:0] LA_coded, LB_coded; 	// codificada
	wire [3:0] LA_decoded, LB_decoded; 	// 4 bits
	
	// señal de reset
	wire reset;
	assign reset = 1'b0;
	
	// FSM con salidas codificadas
	FSM_moore FSM1(TA, TB, clk, reset, LA_coded, LB_coded);
	
	DECODER_2x4 DEC0(LA_coded, LA_decoded);
	DECODER_2x4 DEC1(LB_coded, LB_decoded);
	
	assign LA = LA_decoded[2:0];
	assign LB = LB_decoded[2:0];
	
endmodule

module semaforo_completo (
	input TA, TB, P, R, clk, reset,
	output [2:0] LA, LB
	);
	
	// interconexión de las FSMs
	wire M;
	FSM_moore  FSM1(TA, TB, M, clk, reset, LA, LB);
	FSM_parade FSM2(P, R, clk, reset, M);
	
endmodule

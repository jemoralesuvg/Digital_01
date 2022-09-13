
module top_tb();
    reg A, reset, clk;
    wire pulse;

    pulse_generator U1(A, clk, reset, pulse);
	// variaciones en las entradas
    initial begin
        clk = 0; reset = 1;
		#10 reset = 0;
		#10 A = 1;
		#30 A = 0;
		#10 A = 1;
		#60 A = 0;
    end
    // archivo de GTKwave y fin de la simulación
    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
		#150 $finish;
    end
	// señal de reloj
    always
        #5 clk = ~clk;

endmodule

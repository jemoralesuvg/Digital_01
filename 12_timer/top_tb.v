
module top_tb();
    reg reset, clk;
    wire [7:0] count;

    tmr U1(clk, reset, count);
	// variaciones en las entradas
    initial begin
        clk = 0; reset = 1;
		#15 reset = 0;
		#80 reset = 1;
		#5 reset = 0;
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

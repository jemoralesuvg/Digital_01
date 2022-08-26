//`timescale 1 ns/10 ps

module mux_tb();
	
	reg d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2;
	wire out;
	
	mux_8x1 u1 (d0, d1, d2, d3, d4, d5, d6, d7, s0, s1, s2, out);
	
	initial
	begin
		$monitor("s2 %b s1 %b s0 %b => out %b", s2, s1, s0, out);
		d0 = 0; d1 = 1; d2 = 0; d3 = 0; d4 = 1; d5 = 1; d6 = 0; d7 = 0; 
		s2 = 0; s1 = 0; s0 = 0; 
		#5;
		s2 = 0; s1 = 0; s0 = 1; 
		#5;
		s2 = 0; s1 = 1; s0 = 0; 
		#5;
		s2 = 0; s1 = 1; s0 = 1; 
		#5;
		s2 = 1; s1 = 0; s0 = 0; 
		#5;
		s2 = 1; s1 = 0; s0 = 1; 
		#5;
		s2 = 1; s1 = 1; s0 = 0; 
		#5;
		s2 = 1; s1 = 1; s0 = 1;  
		#5 $finish;
	end
	
	initial begin
        $dumpfile("mux_tb.vcd");
        $dumpvars(0, mux_tb);
    end
	
endmodule
//`timescale 1 ns/10 ps

module top_tb();
	reg data, clk, reset;
	wire out;
	
	FFD_R u0 (data, clk, reset, out);
	
	initial begin
		data = 1'b0; clk = 1'b0; reset = 1'b0;
		#9 data = 1'b1;
		#13 data = 1'b0;
		#12 data = 1'b1;
		#10 ;
		$finish;
	end
	
	initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end
	
	always
		#5 clk = ~clk;
	
endmodule
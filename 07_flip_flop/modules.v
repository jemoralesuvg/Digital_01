module FFD(D,clk,Q);
	input D; // Data input 
	input clk; // clock input 
	output reg Q; // output Q 
	
	always @(posedge clk) 
		begin
			Q <= D; 
		end 
endmodule

module FFD_R( D, clk, reset, Q);
	input D; // Data input 
	input clk; // clock input 
	input reset;
	output reg Q; // output Q 
	
	always @(posedge clk) 
	begin
		if (reset)
			Q <= 1'b0;
		else
			Q <= D; 
	end 
endmodule
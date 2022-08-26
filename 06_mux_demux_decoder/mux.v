module MUX_4x1 ( 
    input d00, d01, d10, d11,
    input s0, s1,
    output out
    ); 

 assign out = s1 ? (s0 ? d11 : d10) : (s0 ? d01 : d00); 

endmodule


module mux_8x1(
	input D0, D1, D2, D3, D4, D5, D6, D7,
	input S2, S1, S0,
	output out);
	
	reg out;
	always@(D0, D1, D2, D3, D4, D5, D6, D7, S2, S1, S0)
		begin
		case( {S2, S1, S0} )
			3'b000: out=D0;
			3'b001: out=D1;
			3'b010: out=D2;
			3'b011: out=D3;
			3'b100: out=D4;
			3'b101: out=D5;
			3'b110: out=D6;
			3'b111: out=D7;
			default: out=1'b0;
		endcase
	end
endmodule
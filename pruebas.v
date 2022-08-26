module ejemplo_gate_level (
	input A, B, C,
	output Y);
	
	// cables para interconexiones
	wire w1, w2;
	// compuertas
	and U1(w1, A, B);
	or U2(w2, w1, C);
	not	U3(Y, w2);
	
endmodule

module behavorial (
	input a,
	output y);
	// asignación a salida
	assign y = ~a; //not
	
endmodule

module combinational(
	// standard de nombres
	// entradas A,B,C..
	input A, B, C,
	// salidas X,Y,Z..
	output X);
	
	assign X = (A & B)|C;
		
endmodule

assign Y = (~A&B)|(A&B);
assign Y = (A|B)&(A|B);
assign Y = ~(A&B) = ~A|~B;
assign Y = ~


module MUX_2x1(D0, D1, S, Y);

output Y; // otra manera de declarar puertos
input D0, D1, S;

assign Y=(S)?D1:D0; //mux 2x1

endmodule

module MUX_4x1 ( 
	input A, B, C, D,
	input s0, s1,
	output out
	); 

 assign out = s1 ? (s0 ? d : c) : (s0 ? b : a); 

endmodule

MUX_4x1 U0 (.A(1'b0), .B(1'b0), .C(1'b0), .D(1'b1), Y);
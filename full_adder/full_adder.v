module full_adder_c(input a, b, cin, output s, cout);

  wire p, g;

  assign p = a ^ b;
  assign g = a & b;

  assign s = p ^ cin;
  assign cout = g | (p & cin);

endmodule



module full_adder_b(input a, b, cin, output reg s, cout);

  reg p, g;

  // Los bloques always sólo pueden manejar reg
  // Las salidas s y cout tienen que ser reg porque los estamos manipulando
  // dentro del always
  // Otra opción sería hacer variables intermedias y luego assigns
  // Realmente es mejor dejar las entradas y salidas como nets

  //reg sReg, coutReg;

  always @ (a, b, cin) begin
    p = a ^ b;
    g = a & b;

    s = p ^ cin;
    //sReg = p ^ cin;
    cout = g | (p & cin);
    //coutReg = g | (p & cin);

  end

   //assign s = sReg;
   //assign cout = coutReg;

endmodule

module top(
  input PIN_1, PIN_2, PIN_3, PIN_4, PIN_5, PIN_6, PIN_7, PIN_8,
  output PIN_9, PIN_10, PIN_11, PIN_12, PIN_13);

wire [3:0] inA, inB, outS;
wire cin, cout;

full_adder_4bit adder(inA, inB, cin, outS, cout);

assign {PIN_1, PIN_2, PIN_3, PIN_4} = inA;
assign {PIN_5, PIN_6, PIN_7, PIN_8} = inB;
assign {PIN_9, PIN_10, PIN_11, PIN_12} = outS;
assign cout = PIN_13;
assign cin = 0;

endmodule

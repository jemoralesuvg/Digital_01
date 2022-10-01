module top(
  input PIN_1, PIN_2, PIN_3, PIN_4, PIN_7, PIN_8, PIN_9, PIN_10,
  output PIN_20, PIN_21, PIN_22, PIN_23, PIN_24, LED);

wire [3:0] inA, inB, outS;
wire cin, cout;

full_adder_4bit adder(inA, inB, cin, outS, cout);

assign inA = {~PIN_4, ~PIN_3, ~PIN_2, ~PIN_1};
assign {~PIN_10, ~PIN_9, ~PIN_8, ~PIN_7} = inB;
assign outS = {PIN_21, PIN_22, PIN_23, PIN_24};
assign cout = PIN_20;
assign cin = 0;
assign LED = 0;
endmodule

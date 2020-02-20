/*`define IN PIN_4
`define EN PIN_5
`define OUT PIN_6
*/

module tristate_buffer(
  input PIN_4, PIN_5,
  output PIN_6);

  wire PIN_6;

  assign PIN_6 = PIN_4 ? PIN_5 : 1'bz;

  endmodule

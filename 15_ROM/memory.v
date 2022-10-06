module ROM(
  input wire [7:0] address,
  output wire [3:0] data);

  reg [3:0] memory [0:256];

  initial
    $readmemb("rom.list", memory);

  assign data = memory[address];
endmodule
/*
module RAM (
	input clk,
	input csRAM, weRAM,
	input [11:0] address,
	input [3:0] data_in,
	output [3:0] data_out
);
	reg [3:0] data_out;
	reg [3:0] memory [0:256];
	wire [7:0] address_small;
	assign address_small = address[7:0];

	//assign data = (csRAM && !weRAM)? data_out: 4'bzzzz;

	// Reading from RAM
  always @ (*) //(negedge clk)//(address_small or csRAM or weRAM)
    //if (csRAM && !weRAM)
      data_out = memory[address_small];

  // Writing to RAM
  always @ (negedge clk)//(address_small or csRAM or weRAM or data)
    if (csRAM && weRAM)
      memory[address_small] = data_in;

endmodule
*/
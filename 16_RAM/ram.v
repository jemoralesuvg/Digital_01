
module RAM (
	input clk,
	input csRAM, weRAM,
	input [3:0] address,
	input [3:0] data_in,
	output [3:0] data_out
);
	wire [3:0] data_out;
	wire [3:0] data;
	reg [3:0] memory [0:16];
	

	assign data = memory[address];
	assign data_out = (csRAM && !weRAM)? data: 4'bzzzz;

	// Reading from RAM
 // always @ (*) 
 //     data_out <= memory[address];

  // Writing to RAM
  always @ (posedge clk) 
    if (csRAM && weRAM)
      memory[address] <= data_in;

endmodule

module ROM(
  input wire [7:0] address,
  output wire [3:0] data);

  reg [3:0] memory [0:256];

  initial
    $readmemb("rom.list", memory);

  assign data = memory[address];
endmodule

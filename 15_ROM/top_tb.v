/*
module testbench_prog_rom();
  logic [11:0] address;
  logic [7:0] data;

  ROM mem0(.address(address), .data(data));

  initial begin
    $display("address:\tdata:");
    for (int i = 0; i < 32; i = i + 1) begin
      #1 address = i;
      $display("%b\t%b", address, data);
    end
  end

  initial
    #100 $finish;
endmodule
*/
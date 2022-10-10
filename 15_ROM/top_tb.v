
module top_tb();
  reg [7:0] address;
  wire [3:0] data;

  ROM mem0(.address(address), .data(data));

  initial begin
    $display("address:\tdata:");
    $monitor("%h\t%b", address, data);
    for (reg[7:0] i = 0; i < 32; i = i + 1) begin
      #1 address = i;
    end
    #100 $finish;
  end

endmodule

`define simulation

module testbench();

reg [3:0] inA, inB; // DIP switches
wire [3:0] outS;    // LEDs
reg cin;            // DIP
wire cout;          // LED

full_adder_4bit adder(inA, inB, cin, outS, cout);

initial begin
  $display("a:\tb:\tcin:\ts:\tcout:");
  $monitor("%d\t%d\t%d\t%d\t%d", inA, inB, cin, outS, cout);
  inA = 4'b0000;
  inB = 4'b0000;
  cin = 1'b0;
  #1
  inA = 1;
  #1
  inB = 1;
  #1
  cin = 1;
end

initial begin
  #50
  $finish;
end

initial begin
  $dumpfile("top_tb.vcd");
  $dumpvars(0, adder);
end

endmodule

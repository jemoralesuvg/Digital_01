//`timescale 1ns/100ps
`define simulation
module tb();

reg in_1, in_0;
wire out_0;

top ejemplo (in_1, in_0, out_0);

  initial begin
    $display("In 1/t In 2 /t Out 1");
    $monitor("%b  /t %b  /t %b",in_1, in_0, out_0);
    in_1 = 0;
    in_0 = 0;
    #1 in_1 = 1;
    #1 in_1 = 0;
       in_0 = 1;
    #1 in_1 = 1;
  end

  initial begin
    #10  $finish;
  end

  initial begin
    $dumpfile("top_tb.vcd");
    $dumpvars(0, ejemplo);
  end
//`endif

endmodule

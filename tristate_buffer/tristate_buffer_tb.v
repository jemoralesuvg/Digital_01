`define simulation
module tristate_buffer_tb();

logic IN, EN;
wire OUT;

tristate_buffer ejemplo (.PIN_4(EN), .PIN_5(IN), .PIN_6(OUT));

  initial begin
    $display("IN \t EN \t OUT");
    $monitor("%b \t %b \t %b",IN, EN, OUT);
    IN = 0;
    EN = 0;
    #1 IN = 1;
    #1 EN = 1;
    #1 IN = 0;
    #1 IN = 1;
    #1 EN = 0;
  end

  initial begin
    #50  $finish;
  end

  initial begin
    $dumpfile("tristate_buffer_tb.vcd");
    $dumpvars(0, ejemplo);
  end
//`endif

endmodule

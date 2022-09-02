
module top_tb();

    reg TA, TB, P, R, clk, reset;
    wire [2:0] LA, LB;

    semaforo_completo U1(TA, TB, P, R, clk, reset, LA, LB);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial
        #200 $finish;

    always
        #5 clk = ~clk;

    initial begin
        clk = 0; TA = 0; TB = 0; 
		P = 0; R = 0; reset = 1;

        #7
        reset = 0;

        #30
        TA = 1;
        #10
        TB = 1;
        #20
        TA = 0;
        #30
        TB = 0;
        #10
        P = 1;
        #30
        P = 0;
        R = 0;

    end
endmodule

module top_tb();

    reg TA, TB, clk;
    wire [2:0] LA, LB;

    semaforo_completo U1(TA, TB, clk, LA, LB);

    initial begin
        $dumpfile("top_tb.vcd");
        $dumpvars(0, top_tb);
    end

    initial
        #150 $finish;

    always
        #5 clk = ~clk;

    initial begin
        clk = 0; TA = 0; TB = 0; //reset = 0;

        //#13
        //reset = 1;
        //#10
        //reset = 0; // esperamos 10s para garantizar que ya pasó 1 flanco de reloj

        #30
        TA = 1;
        #10
        TB = 1;
        #20
        TA = 0;
        #30
        TB = 0;
        #10
        TA = 1;

    end
endmodule

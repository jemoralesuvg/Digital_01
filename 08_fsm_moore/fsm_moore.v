 module FSM_moore(input TA, TB, clk, reset, output reg [1:0] LA, LB);
    reg [1:0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
    parameter green = 2'b00, yellow = 2'b01, red = 2'b10;

    // Nube combinacional para calcular el estado futuro

    always @ (TA or TB or state) begin
        case (state)
            S0: begin
                    if (TA == 1)
                        next_state <= S0; // No incluimos 'begin' y 'end' porque sólo es 1 instrucción dentro del 'case'
                    else
                        next_state <= S1;
                end
            S1: next_state <= S2;
            S2: if (TB == 1) next_state <= S2;
                else next_state <= S3;
            S3: next_state <= S0;
            default: next_state <= S0; // Incluímos el 'default' para que la sintetización sea lógica combinacional y no secuencial
        endcase
    end

    // Banco de flip flops

    always @ (posedge clk or posedge reset) begin

        if (reset == 1)
            state <= S0;
        else
            state <= next_state;
    end

    // Nube combinacional para calcular las salidas
    // 00 = green
    // 01 = yellow
    // 10 == red

    always @ (state) begin
        case (state)
            S0: begin LA = green; LB = red; end
            S1: begin LA = yellow; LB = red; end
            S2: begin LA = red; LB = green; end
            S3: begin LA = red; LB = yellow; end
            default: begin LA = red; LB = red; end
        endcase
    end

endmodule

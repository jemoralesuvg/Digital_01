module FSM_parade(input P, R, clk, reset, output reg M);
    reg state, next_state;
    parameter S0 = 1'b0, S1 = 1'b1;
    parameter on = 1'b1, off = 1'b0;

    // Nube combinacional para calcular el estado futuro

    always @ (P or R or state) begin
        case (state)
            S0: begin
                    if (P == 1)
                        next_state <= S1; 
                    else // siempre completamos el if-else
                        next_state <= S0; 
                end
            S1: begin
                    if (R == 1)
                        next_state <= S0; 
                    else // siempre completamos el if-else
                        next_state <= S1; 
                end
            default: next_state <= S0; // Incluímos el 'default' para que la sintetización sea combinacional
        endcase
    end

    // Banco de flip flops
    always @ (posedge clk or posedge reset) begin

        if (reset == 1)
            state <= S0;
        else
            state <= next_state;
    end
	initial state <= 1'b0;
	
    // Nube combinacional para calcular las salidas
    always @ (state) begin
        case (state)
            S0: M = off;
            S1: M = on;
            default: M = off;
        endcase
    end

endmodule

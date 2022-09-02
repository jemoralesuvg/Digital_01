module mealy_01(input A, clk, reset, output reg Y);
    reg state, next_state;
    parameter S0 = 1'b0, S1 = 1'b1;
    
    // Nube combinacional para calcular el estado futuro y salidas

    always @ (A or state) begin
        case (state)
            S0: begin
                    if (A == 1) begin
                        next_state <= S0; 
						Y <= 0;
                    end else begin
                        next_state <= S1;
						Y <= 0;
					end
                end
            S1: begin
                    if (A == 1) begin
                        next_state <= S0; 
						Y <= 1;
                    end else begin
                        next_state <= S1;
						Y <= 0;
					end
                end
            default: begin
				next_state <= S0; 
				Y <= 0;
			end
        endcase
    end

    // Banco de flip flops
    always @ (posedge clk or posedge reset) begin

        if (reset == 1)
            state <= S0;
        else
            state <= next_state;
    end
	initial state <= 2'b00;
	

endmodule

module moore_01(input A, clk, reset, output reg Y);
    reg [1:0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
    // Nube combinacional para calcular el estado futuro y salidas

    always @ (A or state) begin
        case (state)
            S0: begin
                    if (A == 1)
                        next_state <= S0; 
                    else begin
                        next_state <= S1;
					end
                end
            S1: begin
                    if (A == 1) 
                        next_state <= S2; 
                    else 
                        next_state <= S1;
                end
            S2: begin
                    if (A == 1) 
                        next_state <= S0; 
                    else 
                        next_state <= S1;
                end
            default: 
				next_state <= S0; 
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
	
    // Nube combinacional para calcular las salidas
	 always @ (state) begin
        case (state)
            S0: Y <= 1'b0;
            S1: Y <= 1'b0;
            S2: Y <= 1'b1;
            default: Y <= 1'b1;
        endcase
    end

endmodule

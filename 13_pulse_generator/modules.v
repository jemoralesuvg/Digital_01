module pulse_generator(input A, clk, reset, output reg pulse);
    reg [1:0] state, next_state;
    parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
    
    // Nube combinacional para calcular el estado futuro y salidas

    always @ (A or state) begin
        case (state)
            S0: begin
                    if (A == 1)
                        next_state <= S1; 
                    else begin
                        next_state <= S0;
					end
                end
            S1: begin
                    if (A == 1) 
                        next_state <= S2; 
                    else 
                        next_state <= S0;
                end
            S2: begin
                    if (A == 1) 
                        next_state <= S2; 
                    else 
                        next_state <= S0;
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
            S0: pulse <= 1'b0;
            S1: pulse <= 1'b1;
            S2: pulse <= 1'b0;
            default: pulse <= 1'b0;
        endcase
    end

endmodule

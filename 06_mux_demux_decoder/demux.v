module DEMUX_1x4 ( 
    input [1:0] sel, 
    input din,
    output reg [3:0] Y);
    always @(Y, sel) begin
        case (sel)
            2'b00 : begin 
                Y[0] <= din; 
                Y[1] <= 0; Y[2] <= 0; Y[3] <= 0; 
                end
            2'b01 : begin 
                Y[1] <= din; 
                Y[0] <= 0; Y[2] <= 0; Y[3] <= 0;   
                end
            2'b10 : begin 
                Y[2] <= din; 
                Y[0] <= 0; Y[1] <= 0; Y[3] <= 0;
                end
            2'b11 : begin 
                Y[3] <= din; 
                Y[0] <= 0; Y[1] <= 0; Y[2] <= 0;
                end
        endcase   
    end
endmodule

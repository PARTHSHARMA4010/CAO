module simple_alu (
    input [1:0] A,         
    input [1:0] B,          
    input [1:0] ctrl,       
    output reg [3:0] y,
    output reg c    
);
    
    always @(*) begin
        c = 0;
        case (ctrl)
            2'b00: begin // Addition
                {c, y} = A + B; 
            end
            2'b01: begin // Subtraction
                {c, y} = A - B; 
            end
            2'b10: begin // Multiplication
                y = A * B; 
                c = 0;     
            end
            2'b11: begin 
                if (B != 0) begin
                    y = A / B; 
                    c = 0;     
                end else begin
                    y = 4'b0000; 
                    c = 1;  
                end
            end
            default: begin
                y = 4'b0000; // Default output
            end
        endcase
    end

endmodule


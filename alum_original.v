module simple_alu_memory (
    input [1:0] A,
    input [1:0] B,          
    input [1:0] ctrl,       
    input [1:0] addr,       
    input we,               
    output reg [3:0] y,     
    output reg c            
);
    
    reg [3:0] memory [0:3];
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
            2'b11: begin // Division
                if (B != 0) begin
                    y = A / B; 
                    c = 0;     
                end else begin
                    y = 4'b0000; // Set result to 0 for division by zero
                    c = 1;       // Set carry-out to indicate error
                end
            end
            default: begin
                y = 4'b0000; // Default output
            end
        endcase

        // Memory write operation
        if (we) begin
            memory[addr] = y; // Store result in memory
        end
    end

endmodule


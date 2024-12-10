module simple_alu_memory (
    input [1:0] A,          // 2-bit input A
    input [1:0] B,          // 2-bit input B
    input [1:0] ctrl,       // 2-bit control signal
    input [1:0] addr,       // Address for memory
    input we,               // Write enable signal
    output reg [3:0] y,     // 4-bit output result
    output reg c            // Carry-out flag
);
    
    reg [3:0] memory [0:3]; // Memory array to store result
    always @(*) begin
        c = 0; // Initialize carry-out to 0
        case (ctrl)
            2'b00: begin // Addition
                {c, y} = A + B; // Perform addition
            end
            2'b01: begin // Subtraction
                {c, y} = A - B; // Perform subtraction
            end
            2'b10: begin // Multiplication
                y = A * B; // Perform multiplication
                c = 0;     // No carry-out for multiplication
            end
            2'b11: begin // Division
                if (B != 0) begin
                    y = A / B; // Perform division
                    c = 0;     // No carry-out for valid division
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


module alu_with_memory (
    input clk,                // Clock input
    input reset,              // Reset signal
    input [1:0] a,            // Operand A
    input [1:0] b,            // Operand B
    input [1:0] ctrl,         // Control signal
    input [1:0] reg_addr,     // Address to store result in register memory
    input reg_write,          // Write enable for register memory
    output reg [3:0] y,       // ALU output
    output reg c,             // Carry/Overflow flag
    output reg done,          // Done signal (indicating operation completion)
    output [3:0] reg_data     // Data of the selected register (for checking)
);

    // Register file: 4 registers, each 4 bits wide
    reg [3:0] reg_file [3:0];  // 4 registers of 4 bits each

    // States for the multicycle operation using localparams
    localparam FETCH = 2'b00;
    localparam EXECUTE = 2'b01;
    localparam WRITEBACK = 2'b10;

    reg [1:0] state, next_state;
    reg [1:0] a_reg, b_reg;
    reg [1:0] ctrl_reg;

    // Register memory read output (for checking the value of the register)
    assign reg_data = reg_file[reg_addr];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= FETCH;
            done <= 0;
            c <= 0;
            y <= 0;
            // Initialize register file to zero
            reg_file[0] <= 4'b0000;
            reg_file[1] <= 4'b0000;
            reg_file[2] <= 4'b0000;
            reg_file[3] <= 4'b0000;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        // Default values for outputs
        done = 0;
        next_state = state; // Keep current state unless changed
        case (state)
            FETCH: begin
                // Fetch stage - capture inputs and prepare for execution
                a_reg = a;
                b_reg = b;
                ctrl_reg = ctrl;
                next_state = EXECUTE;  // Move to execute
            end
            EXECUTE: begin
                // Execute stage - perform ALU operation
                case (ctrl_reg)
                    2'b00: begin // Add
                        {c, y} = a_reg + b_reg; 
                    end
                    2'b01: begin // Subtract
                        {c, y} = a_reg - b_reg; 
                    end
                    2'b10: begin // Multiply
                        y = a_reg * b_reg; 
                        c = 0; // No overflow
                    end
                    2'b11: begin // Divide
                        if (b_reg != 0) begin
                            y = a_reg / b_reg; 
                            c = 0; // No error
                        end else begin
                            y = 4'b0000; 
                            c = 1; // Error due to division by zero
                        end
                    end
                    default: begin
                        y = 4'b0000; 
                        c = 0;
                    end
                endcase
                next_state = WRITEBACK;  // Move to write-back stage
            end
            WRITEBACK: begin
                // Write-back stage - store result in the register memory if write enable is active
                if (reg_write) begin
                    reg_file[reg_addr] <= y;  // Store ALU result in selected register
                end
                done = 1;  // Signal that operation is complete
                next_state = FETCH;  // Return to fetch state for next operation
            end
            default: begin
                next_state = FETCH;
            end
        endcase
    end

endmodule


module tb_alu_memory;

// Test bench signals
reg [1:0] A;          // 2-bit input A
reg [1:0] B;          // 2-bit input B
reg [1:0] ctrl;       // 2-bit control signal
reg [1:0] addr;       // Address for memory
reg we;               // Write enable signal
wire [3:0] y;        // 4-bit output result
wire c;              // Carry-out flag

// Instantiate the ALU module
simple_alu_memory uut (
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .addr(addr),
    .we(we),
    .y(y),
    .c(c)
);

// Initial block for stimulus
initial begin
    // Open the dump file for waveform output
    $dumpfile("alu_testm.vcd");
    $dumpvars(0, tb_alu_memory);

    // Test case 1: Addition (A = 2, B = 1)
    we = 1; // Enable writing
    A = 2'b10; B = 2'b01; ctrl = 2'b00; addr = 2'b00; #10;
    // Expected: y = 4'b0011 (3), c = 0

    // Test case 2: Addition (A = 2, B = 2)
    A = 2'b10; B = 2'b10; ctrl = 2'b00; addr = 2'b01; #10;
    // Expected: y = 4'b0100 (4), c = 0

    // Test case 3: Subtraction (A = 2, B = 1)
    A = 2'b10; B = 2'b01; ctrl = 2'b01; addr = 2'b10; #10;
    // Expected: y = 4'b0001 (1), c = 0

    // Test case 4: Subtraction (A = 1, B = 2)
    A = 2'b01; B = 2'b10; ctrl = 2'b01; addr = 2'b11; #10;
    // Expected: y = 4'b1111 (3), c = 1 (borrow)

    // Test case 5: Multiplication (A = 2, B = 2)
    A = 2'b10; B = 2'b10; ctrl = 2'b10; addr = 2'b00; #10;
    // Expected: y = 4'b0100 (4), c = 0

    // Test case 6: Division (A = 2, B = 1)
    A = 2'b10; B = 2'b01; ctrl = 2'b11; addr = 2'b01; #10;
    // Expected: y = 4'b0010 (2), c = 0

    // Test case 7: Division (A = 2, B = 2)
    A = 2'b10; B = 2'b10; ctrl = 2'b11; addr = 2'b10; #10;
    // Expected: y = 4'b0001 (1), c = 0

    // Test case 8: Division by zero (A = 2, B = 0)
    A = 2'b10; B = 2'b00; ctrl = 2'b11; addr = 2'b11; #10;
    // Expected: y = 4'b0000 (0), c = 1 (error)

    // End the simulation
    $finish;
end

endmodule


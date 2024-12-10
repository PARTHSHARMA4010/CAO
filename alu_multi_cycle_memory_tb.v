module tb_alu_with_memory;

    reg clk;
    reg reset;
    reg [1:0] a;   
    reg [1:0] b;          
    reg [1:0] ctrl;      
    reg [1:0] reg_addr;   // Register address to store result
    reg reg_write;         // Write enable for register
    wire [3:0] y;        
    wire c;              
    wire done;           // Done signal from the ALU
    wire [3:0] reg_data; // Data of the selected register

    // Instantiate the ALU with register memory
    alu_with_memory uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .reg_addr(reg_addr),
        .reg_write(reg_write),
        .y(y),
        .c(c),
        .done(done),
        .reg_data(reg_data)
    );

    // Clock generation
    always begin
        #15 clk = ~clk;  // Generate clock with a period of 15
    end

    // Test cases
    initial begin
        // Initial setup
        $dumpfile("alu_with_memory_test.vcd");
        $dumpvars(0, tb_alu_with_memory);

        clk = 0;
        reset = 1;
        a = 2'b10;
        b = 2'b01;
        ctrl = 2'b00;  // ADD
        reg_addr = 2'b00;
        reg_write = 0;
        #15 reset = 0; // Release reset

        // Test ADD operation and store result in register 0
        #15 reg_write = 1; // Enable write to register 0
        a = 2'b10; b = 2'b11; ctrl = 2'b00;  // ADD (2 + 1 = 3)
        #35;
        reg_write = 0; // Disable write to register

        // Check if register 0 contains the result
        #15;
        $display("Register 0: %b", reg_data); // Should display 3 (00000011)

        // Test SUBTRACT operation and store result in register 1
        #15 reg_write = 1;
        a = 2'b11; b = 2'b01; ctrl = 2'b01;  // SUBTRACT (2 - 1 = 1)
        reg_addr = 2'b01; // Store result in register 1
        #35;
        reg_write = 0;

        // Check if register 1 contains the result
        #15;
        $display("Register 1: %b", reg_data); // Should display 1 (00000001)

        // Finish simulation
        $finish;
    end
endmodule


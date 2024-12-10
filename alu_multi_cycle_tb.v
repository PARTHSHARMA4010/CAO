module tb_au;

    reg clk;
    reg reset;
    reg [1:0] a;   
    reg [1:0] b;          
    reg [1:0] ctrl;      
    wire [3:0] y;        
    wire c;              
    wire done;           // Done signal from the ALU

    // Instantiate the ALU module
    au uut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .b(b),
        .ctrl(ctrl),
        .y(y),
        .c(c),
        .done(done)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;  // Generate clock with a period of 10
    end

    // Test cases
    initial begin
        // Initial setup
        $dumpfile("au_test.vcd");
        $dumpvars(0, tb_au);

        clk = 0;
        reset = 1;
        a = 2'b10;
        b = 2'b01;
        ctrl = 2'b00;  // ADD
        #10 reset = 0; // Release reset

        // Test ADD operation
        #10;
        a = 2'b10; b = 2'b11; ctrl = 2'b00;  
        #20;  // Wait for the operation to complete

        // Test SUBTRACT operation
        a = 2'b10; b = 2'b01; ctrl = 2'b01;  // SUBTRACT (2 - 1 = 1)
        #20;

        // Test MULTIPLY operation
        a = 2'b10; b = 2'b10; ctrl = 2'b10;  // MULTIPLY (2 * 2 = 4)
        #20;

        // Test DIVIDE operation
        a = 2'b10; b = 2'b10; ctrl = 2'b11;  // DIVIDE (2 / 1 = 2)
        #20;

        // Test DIVIDE by zero
        a = 2'b10; b = 2'b00; ctrl = 2'b11;  // DIVIDE by 0 (should signal error)
        #20;

        $finish;
    end
endmodule


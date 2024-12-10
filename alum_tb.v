module tb_alu_memory;
reg [1:0] A;         
reg [1:0] B;          
reg [1:0] ctrl;       
reg [1:0] addr;       
reg we;               
wire [3:0] y;       
wire c;
simple_alu_memory uut (
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .addr(addr),
    .we(we),
    .y(y),
    .c(c)
);
initial begin
    $dumpfile("alu_testm.vcd");
    $dumpvars(0, tb_alu_memory);
    we = 1; // Enable writing
    A = 2'b10; B = 2'b01; ctrl = 2'b00; addr = 2'b00; #16;
    A = 2'b10; B = 2'b10; ctrl = 2'b01; addr = 2'b01; #16;
    A = 2'b01; B = 2'b10; ctrl = 2'b10; addr = 2'b10; #16;
    A = 2'b10; B = 2'b01; ctrl = 2'b01; addr = 2'b11; #16;
    A = 2'b10; B = 2'b00; ctrl = 2'b11; addr = 2'b00; #16;
    $finish;
end

endmodule

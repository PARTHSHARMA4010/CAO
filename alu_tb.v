module tb_alu;

reg [1:0] A;   
reg [1:0] B;          
reg [1:0] ctrl;      
wire[3:0] y;        
wire c;              

simple_alu uut (
    .A(A),
    .B(B),
    .ctrl(ctrl),
    .y(y),
    .c(c)
);
initial begin
    $dumpfile("alu_test.vcd");
    $dumpvars(0, tb_alu);
    A = 2'b10; B = 2'b01; ctrl = 2'b00; #16;
    A = 2'b10; B = 2'b01; ctrl = 2'b01; #16;
    A = 2'b10; B = 2'b10; ctrl = 2'b10; #16;
    A = 2'b10; B = 2'b01; ctrl = 2'b11; #16;
    A = 2'b10; B = 2'b00; ctrl = 2'b11; #16;
    $finish;
end
endmodule


module halfaddr_test;

reg a,b;
reg clk;
reg [3:0] addr;
wire sum, carry;

halfaddr uut(
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry),
    .clk(clk),
    .addr(addr)
);

always begin
#5 clk = ~clk; 
end
initial begin 
clk = 0;
a =0; b=0;
addr = 0;
$dumpfile("halfaddr_saumya.vcd");
$dumpvars(0,halfaddr_test);

#12; a=0; b=0; addr =0;
#12; a=0; b=1; addr =1;
#12; a=1; b=0; addr =2;
#12; a=1; b=1; addr =3;

$finish;
end
initial begin 
$monitor("Time = %0t |a=%b | b=%b | sum = %b | carry = %b | addr = %d", $time, a,b,sum,carry,addr);
end 
endmodule


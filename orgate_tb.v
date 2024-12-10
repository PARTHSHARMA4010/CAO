module orgate_test;
reg a,b;
wire y;
orgate uut(a,b,y);
initial begin 
$dumpfile("orgate.vcd");
$dumpvars(0,orgate_test);
a=0;b=0;
#10
a=0;b=1;
#10
a=1;b=0;
#10
a=1;b=1;
#10
$finish();
end
endmodule

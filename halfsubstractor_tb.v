module halfsubstractor_test;
reg a,b;
wire s,c;
halfsubstractor uut(
.a(a),
.b(b),
.s(s),
.c(c)
);
initial begin 
$dumpfile("halfsubstractor.vcd");
$dumpvars(0,halfsubstractor_test);
a=0;b=0;
#12
a=0;b=1;
#12
a=1;b=0;
#12
a=1;b=1;
#12
$finish();
end
endmodule

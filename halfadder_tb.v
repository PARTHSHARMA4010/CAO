module halfadder_test;
reg a,b;
wire s,c;
halfadder uut(
.a(a),
.b(b),
.s(s),
.c(c)
);
initial begin 
$dumpfile("halfadder.vcd");
$dumpvars(0,halfadder_test);
a=0;b=0;
#14
a=0;b=1;
#14
a=1;b=0;
#14
a=1;b=1;
#14
$finish();
end
endmodule

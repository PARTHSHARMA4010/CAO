module fullsubstractor_test;
reg a,b,ci;
wire s,co;
fullsubstractor uut(
.a(a),
.b(b),
.ci(ci),
.s(s),
.co(co),
.x(x),
.y(y),
.z(z),
.m(m),
.n(n)
);
initial begin 
$dumpfile("fullsubstractor.vcd");
$dumpvars(0,fullsubstractor_test);
a=0;b=0;ci=0;
#9
a=0;b=0;ci=1;
#9
a=0;b=1;ci=0;
#9
a=0;b=1;ci=1;
#9
a=1;b=0;ci=0;
#9
a=1;b=0;ci=1;
#9
a=1;b=1;ci=0;
#9
a=1;b=1;ci=1;
#9
$finish();
end
endmodule

module fulladder_test;
reg a,b,ci;
wire s,co;
fulladder uut(
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
$dumpfile("fulladder.vcd");
$dumpvars(0,fulladder_test);
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

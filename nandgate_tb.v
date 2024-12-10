module nandgate_test;
reg a,b;
wire y;
nandgate uut(a,b,y);
initial begin 
$dumpfile("nandgate.vcd");
$dumpvars(0,nandgate_test);
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

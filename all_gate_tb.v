module all_gate_test;
reg a,b;
wire y1, y2, y3, y4, y5, y6;
all_gate uut(a, b, y1, y2, y3, y4, y5, y6);
initial begin 
$dumpfile("all_gate.vcd");
$dumpvars(0,all_gate_test);
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

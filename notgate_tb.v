module notgate_test;
reg a;
wire y;
notgate uut(a,y);
initial begin 
$dumpfile("notgate.vcd");
$dumpvars(0,notgate_test);
a=0;
#10
a=1;
     #10
$finish();
end
endmodule

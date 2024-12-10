module Exorgate_test;
reg a,b;
wire y;
Exorgate uut(a,b,y);
initial begin 
$dumpfile("Ex-orgate.vcd");
$dumpvars(0,Exorgate_test);
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

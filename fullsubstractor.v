module fullsubstractor(
	input a,b,ci,
	output s,co,x,y,z,m,n
	);
	xor(n,a,b);
	xor(s,n,ci);
	and(x,~a,b);
	and(y,b,ci);
	and(z,ci,~a);
	or(m,x,y);
	or(co,m,z);
	endmodule

module all_gate (
    input a,b,
    output y1,
    output y2,
    output y3,
    output y4,
    output y5,
    output y6
    );
    and(y1,a,b);
    or(y2,a, b);
    nand(y3,a,b);
    nor(y4,a, b);
    xor(y5,a, b);
    xnor(y6,a, b);
endmodule

module cm_tb;
    reg [2:0] R0, R1, R2;
    reg [1:0] opcode;
    wire [2:0] R_EXTRA;

    cm uut (
        .R0(R0),
        .R1(R1),
        .R2(R2),
        .opcode(opcode),
        .R_EXTRA(R_EXTRA)
    );

    initial begin
        $dumpfile("cm.vcd");
        $dumpvars(0, cm_tb);

        R0 = 3'b001;
        R1 = 3'b100;
        R2 = 3'b010;
        opcode = 2'b00; #3;
        opcode = 2'b01; #3;
        opcode = 2'b10; #3;
        opcode = 2'b11; #3;
    end
endmodule

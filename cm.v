module cm(
    input [2:0] R0, R1, R2,
    input [1:0] opcode,
    output reg [2:0] R_EXTRA
);
    always @(*) begin
        case (opcode)
            2'b00: R_EXTRA = R1 + R2;
            2'b01: R_EXTRA = R1 - R2;
            2'b10: R_EXTRA = R1 & R0;
            2'b11: R_EXTRA = R1 | R0;
            default: R_EXTRA = 3'b000;
        endcase
    end
endmodule

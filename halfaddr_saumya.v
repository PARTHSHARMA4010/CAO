module halfaddr(
    input a,b,
    output sum, carry, 
    input clk,
    input [3:0] addr
);
output reg [1:0] reg_memory[0:15];
xor(sum, a, b);
and(carry, a, b);

always @(posedge clk) begin
reg_memory[addr] <= {sum, carry};
end
endmodule
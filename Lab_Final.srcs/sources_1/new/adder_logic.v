
module adder_logic(
input A,
input B,
input C,

output Y,
output Cout
);
// Simplified: A ^ B ^ C
// Kmap derivation:  (~A & ~B & C) | (~A & B & ~C) | (A & B & C) | (A & ~B & ~C)
assign Y = A ^ B ^ C;
// Simplified: (A | B) & C
// Kmap derivation: (B & C) | (A & B) | (A & C) 
assign Cout = (B & C) | (A & B) | (A & C);


endmodule


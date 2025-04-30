module math_block(
    input [3:0] Aval,
    input [3:0] Bval,
    output [3:0] AplusB,
    output [3:0] AminusB
);

wire [3:0] Bminus; //holds two value of B (-B)

    adder_calc twosconversion (
    .A(~Bval [3:0]),
    .B(4'b0001), //adds the extra bit
    .Y(Bminus [3:0])
    );
    
    adder_calc Aplus(
        .A(Aval [3:0]),
        .B(Bval [3:0]),
        .Y(AplusB [3:0])
    );
    
    adder_calc Aminus(
        .A(Aval [3:0]),
        .B(Bminus [3:0]),
        .Y(AminusB [3:0])
    );
endmodule
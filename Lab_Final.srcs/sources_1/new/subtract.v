module subtract(
    input [3:0] A,
    output [3:0] Y
);

    
// Second addition
    wire [3:0] second_carry;
    
    adder bit0(
        .A(~A[0]), 
        .B(1'b1), 
        .Y(Y[0]), 
        .C(0), 
        .Cout(second_carry[0]) 
    );
   
    adder bit1(
        .A(~A[1]), 
        .B(0), 
        .Y(Y[1]), 
        .C(second_carry[0]), 
        .Cout(second_carry[1]) 
    );
    

    adder bit2(
        .A(~A[2]), 
        .B(0), 
        .Y(Y[2]), 
        .C(second_carry[1]), 
        .Cout(second_carry[2])
        // bit of second addition
    
    );
    
    adder bit3(
        .A(~A[3]),
        .B(0),
        .Y(Y[3]),
        .C(second_carry[2]),
        .Cout(second_carry[3])
        // no carry out!
    );
    
    adder bit4(
        .A(~A[4]),
        .B(0),
        .Y(Y[4]),
        .C(second_carry[3]),
        .Cout(second_carry[4])
        // no carry out!
    );
endmodule
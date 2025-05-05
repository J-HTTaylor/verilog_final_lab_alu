module adder_calc(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Y
);

    

    wire [3:0] second_carry; 
    
    adder_logic lsb(
        .A(A[0]), 
        .B(B[0]), 
        .Y(Y[0]), 
        .C(0), 
        .Cout(second_carry[0]) 
    );
   
    adder_logic bit1(
        .A(A[1]), 
        .B(B[1]), 
        .Y(Y[1]), 
        .C(second_carry[0]), 
        .Cout(second_carry[1]) 
    );
    

    adder_logic bit2(
        .A(A[2]), 
        .B(B[2]), 
        .Y(Y[2]), 
        .C(second_carry[1]), 
        .Cout(second_carry[2])
        // bit of second addition
    
    );
    
    adder_logic msb(
        .A(A[3]),
        .B(B[3]),
        .Y(Y[3]),
        .C(second_carry[2]),
        .Cout(second_carry[3])
        // no carry out!
     );
endmodule
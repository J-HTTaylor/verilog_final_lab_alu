`timescale 1ns / 1ps

module DFF(
    input Default,
    input D,
    input clk,
    input r,
    output reg Q,
    output NotQ
);
    assign NotQ = ~Q;
    
    initial begin
        Q <= Default;
    end

    always @(posedge clk, posedge r) begin
        if (r)begin
            Q <= Default;
            end      
        else begin
            Q <= D;
            end 
    end
endmodule

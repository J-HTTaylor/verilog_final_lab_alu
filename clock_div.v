module clock_div
#(
    parameter DIVIDE_BY = 17
)
(
    input clock,
    input reset,
    output div_clock
);

    genvar i;
    wire [16:0]notHold;
    wire [16:0]div_clock_hold;
    
    
    DFF initbase(
                .Default(1'b0),
                .D(notHold[0]),
                .clk(clock),
                .r(reset),
                .Q(div_clock_hold[0]),
                .NotQ(notHold[0])
            );
             
    generate
        for (i = 1; i < DIVIDE_BY; i = i + 1)begin //saves writing out DFF 17 times
        
            DFF init(
                .Default(1'b0),
                .D(notHold[i]),
                .clk(div_clock_hold[i - 1]),
                .r(reset),
                .Q(div_clock_hold[i]),
                .NotQ(notHold[i])
            );

        end
    endgenerate

    assign div_clock = div_clock_hold[DIVIDE_BY - 1]; //used param to make testing work correctly

endmodule
module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

wire [3:0] state;
wire [3:0] next;

    DFF msb_init( //high to low
    .Default(1'b1),
    .D(next[3]),
    .clk(div_clock),
    .r(reset),
    .Q(state[3])
);

DFF bit_init(
    .Default(1'b1),
    .D(next[2]),
    .clk(div_clock),
    .r(reset),
    .Q(state[2])
);

DFF bit_three_init(
    .Default(1'b1),
    .D(next[1]),
    .clk(div_clock),
    .r(reset),
    .Q(state[1])
);

DFF lsb_init(
    .Default(1'b0),
    .D(next[0]),
    .clk(div_clock),
    .r(reset),
    .Q(state[0])
);
    

    assign next[3] =   state[2]; 
    assign next[2] = state[1];
    assign next[1] = state[0];
    assign next[0] = state[3];
    
    assign anode ={state[3],state[2],state[1],state[0]};

endmodule
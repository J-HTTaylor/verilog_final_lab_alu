module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);
//// inverse one-hot encoding (nickname one-cold)
//wire [3:0] state;
//wire [3:0] next;

//    DFF msb_init( //high to low
//    .Default(1'b1),
//    .D(next[3]),
//    .clk(div_clock),
//    .r(reset),
//    .Q(state[3])
//);

//DFF bit_init(
//    .Default(1'b1),
//    .D(next[2]),
//    .clk(div_clock),
//    .r(reset),
//    .Q(state[2])
//);

//DFF bit_three_init(
//    .Default(1'b1),
//    .D(next[1]),
//    .clk(div_clock),
//    .r(reset),
//    .Q(state[1])
//);

//DFF lsb_init(
//    .Default(1'b0),
//    .D(next[0]),
//    .clk(div_clock),
//    .r(reset),
//    .Q(state[0])
//);
    

//    assign next[3] =  state[2]; 
//    assign next[2] = state[1];
//    assign next[1] = state[0];
//    assign next[0] = state[3];
    
//    assign anode ={state[3],state[2],state[1],state[0]};

//binary encoding

wire [1:0] bin_val;
wire [1:0] bin_state;
reg [3:0]anode_binary;

DFF msb_init( //high to low
    .Default(1'b1),
    .D(bin_val[1]),
    .clk(div_clock),
    .r(reset),
    .Q(bin_state[1])
);

DFF lsb_init( //high to low
    .Default(1'b1),
    .D(bin_val[0]),
    .clk(div_clock),
    .r(reset),
    .Q(bin_state[0])
);

    assign bin_val[1] =  bin_state[1] ^ bin_state[0]; 
    assign bin_val[0] = ~bin_state[0];
    
    always @(*)begin
        case(bin_val)
            2'b00: anode_binary <= 4'b1110;
            2'b01: anode_binary <= 4'b1101;
            2'b10: anode_binary <= 4'b1011;
            2'b11: anode_binary <= 4'b0111;
        endcase
    end
    
    assign anode = anode_binary;
endmodule
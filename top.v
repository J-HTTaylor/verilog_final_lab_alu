module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);

    // Instantiate the clock divider...
    wire clock_div_val;
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY))clockinit( //# needed for testing changes
        .clock(clk),
        .reset(btnC),
        .div_clock(clock_div_val)
    );
    
    // ... wire it up to the scanner
    seven_seg_scanner scaninit(
        .div_clock(clock_div_val),
        .reset(btnC),
        .anode(an[3:0])
    );
    // ... wire the scanner to the decoder
    seven_seg_decoder decodeinit(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(Aplus[3:0]),
        .AminusB(Aminus[3:0]),
        .anode(an[3:0]),
        .segs(seg[6:0])
    );
    // Wire up the math block into the decoder
wire [3:0]Aplus;
wire[3:0]Aminus;

    math_block mathinit(
        .Aval(sw[3:0]),
        .Bval(sw[7:4]),
        .AplusB(Aplus[3:0]),
        .AminusB(Aminus[3:0])
    );

    // Do not forget to wire up resets!!

endmodule
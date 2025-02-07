module Multiplexer2to1 #(parameter WSIZE = 32) (
    input wire [WSIZE-1:0] input1,
    input wire [WSIZE-1:0] input2,
    input wire selector,
    output wire [WSIZE-1:0] output
);

    // Lógica do multiplexador
    assign output = (selector == 1'b0) ? input1 : input2;

endmodule

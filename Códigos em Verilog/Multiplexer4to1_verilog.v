module Multiplexer4to1 #(parameter WSIZE = 32) (
    input wire [WSIZE-1:0] input1,
    input wire [WSIZE-1:0] input2,
    input wire [WSIZE-1:0] input3,
    input wire [WSIZE-1:0] input4,
    input wire [1:0] selector,
    output wire [WSIZE-1:0] output
);

    // Lógica do multiplexador
    assign output = (selector == 2'b00) ? input1 :
                    (selector == 2'b01) ? input2 :
                    (selector == 2'b10) ? input3 :
                    input4;

endmodule

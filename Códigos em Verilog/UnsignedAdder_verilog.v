module UnsignedAdder #(parameter WSIZE = 32) (
    input wire [WSIZE-1:0] input1,
    input wire [WSIZE-1:0] input2,
    output wire [WSIZE-1:0] output
);

    // Lógica do somador
    assign output = input1 + input2;

endmodule

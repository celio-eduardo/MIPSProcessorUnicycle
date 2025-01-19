module NibbleDisplayConverter (
    input wire [31:0] input,
    output wire [0:55] output
);

    // Instanciação dos componentes NibbleDisplay
    NibbleDisplay ND_0 (
        .nibble(input[3:0]),
        .display_code(output[0:6])
    );

    NibbleDisplay ND_1 (
        .nibble(input[7:4]),
        .display_code(output[7:13])
    );

    NibbleDisplay ND_2 (
        .nibble(input[11:8]),
        .display_code(output[14:20])
    );

    NibbleDisplay ND_3 (
        .nibble(input[15:12]),
        .display_code(output[21:27])
    );

    NibbleDisplay ND_4 (
        .nibble(input[19:16]),
        .display_code(output[28:34])
    );

    NibbleDisplay ND_5 (
        .nibble(input[23:20]),
        .display_code(output[35:41])
    );

    NibbleDisplay ND_6 (
        .nibble(input[27:24]),
        .display_code(output[42:48])
    );

    NibbleDisplay ND_7 (
        .nibble(input[31:28]),
        .display_code(output[49:55])
    );

endmodule

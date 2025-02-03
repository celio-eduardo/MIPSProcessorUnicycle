module Endereco_Converter(
    input [31:0] endereco,    // Endereço original (ex: 0x10010004)
    output [13:0] converted  // Índice convertido (14 bits: 0x0001)
);

    // Calcular diferenca (endereco - 0x10010000)
    wire [31:0] diff = endereco - 32'h10010000;

    // shift right não pegando os 2 bits menos significativos (dividindo por 4)
    assign converted = diff[15:2];

endmodule
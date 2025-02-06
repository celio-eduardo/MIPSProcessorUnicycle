module PC_Converter(
    input [31:0] PC,        // Endereço original (ex: 0x00400004)
    output [11:0] converted  // Endereço convertido (ex: 001)
);

    assign converted = PC[13:2]; // Resultado em 12 bits (ex: 12'h000, 12'h001)

endmodule
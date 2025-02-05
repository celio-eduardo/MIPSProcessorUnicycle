module MemInst(
    input [11:0] PC,        // Endereço de 12 bits (0x000 a 0xFFF)
    output [31:0] IR        // Instrução lida
);

    reg [31:0] rom [0:4095];
    initial begin
        $readmemh("TEXT_clean.mif", rom);
    end

    // Leitura assíncrona
    assign IR = rom[PC];

endmodule
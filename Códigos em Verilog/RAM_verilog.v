module RAM #(
    parameter MIF_FILE = "RAM.mif", // Arquivo de inicialização da memória
    parameter ADDR_WIDTH = 8,       // Largura do endereço (8 bits para 256 palavras)
    parameter DATA_WIDTH = 32       // Largura dos dados (32 bits)
) (
    input wire clock,               // Sinal de clock
    input wire [ADDR_WIDTH-1:0] address, // Endereço de leitura/escrita
    input wire [DATA_WIDTH-1:0] data,   // Dados de entrada para escrita
    input wire wren,                // Sinal de habilitação de escrita
    output reg [DATA_WIDTH-1:0] q   // Dados de saída
);

    // Memória interna
    reg [DATA_WIDTH-1:0] memory [0:(1 << ADDR_WIDTH)-1];

    // Inicialização da memória a partir de um arquivo .mif
    initial begin
        if (MIF_FILE != "") begin
            $readmemh(MIF_FILE, memory);
        end
    end

    // Lógica de leitura/escrita
    always @(posedge clock) begin
        if (wren) begin
            // Escrita na memória
            memory[address] <= data;
        end
        // Leitura da memória
        q <= memory[address];
    end

endmodule

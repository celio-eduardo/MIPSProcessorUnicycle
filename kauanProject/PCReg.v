module PCReg(
    input clk,
    input [31:0] next_PC,   // Próximo valor do PC
    output reg [31:0] PC    // Valor atual do PC
);
    // Inicialização do PC (ex: 0x00400000 para o MARS MIPS)
    initial begin
        PC = 32'h00400000;
    end

    // Atualização do PC na borda de subida do clock
    always @(posedge clk) begin
		PC <= next_PC;      // Atualiza para o próximo valor
    end

endmodule
module PCReg(
    input clk,
	 input Jump,
	 input Jr,
    input [31:0] PCPp,   // Próximo valor do PC
	 input [31:0] PCJr,
	 input [31:0] PCJ,
    output reg [31:0] PC    // Valor atual do PC
);
    // Inicialização do PC (ex: 0x00400000 para o MARS MIPS)
    initial begin
        PC = 32'h00400000;
    end

    // Atualização do PC na borda de subida do clock
    always @(posedge clk) begin
	 if (Jump) PC <= PCJ;      // Atualiza para o próximo valor
	 else if (Jr) PC <= PCJr;
	 else PC <= PCPp;
	 end
endmodule
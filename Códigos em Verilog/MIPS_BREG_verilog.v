module MIPS_BREG #(parameter WSIZE = 32) (
    input wire clock,
    input wire reset,
    input wire write_enable,
    input wire [4:0] readADDR1,
    input wire [4:0] readADDR2,
    input wire [4:0] writeADDR,
    input wire [WSIZE-1:0] write_data,
    output wire [WSIZE-1:0] Reg1,
    output wire [WSIZE-1:0] Reg2
);

    // Definição do array de registradores
    reg [WSIZE-1:0] GPR [0:31];

    // Inicialização dos registradores com zeros
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            GPR[i] = {WSIZE{1'b0}};
        end
    end

    // Leitura dos registradores
    assign Reg1 = GPR[readADDR1];
    assign Reg2 = GPR[readADDR2];

    // Processo síncrono para escrita e reset
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            // Reset: todos os registradores são zerados
            for (i = 0; i < 32; i = i + 1) begin
                GPR[i] <= {WSIZE{1'b0}};
            end
        end
        else if (write_enable && writeADDR != 5'b00000) begin
            // Escrita no registrador (exceto no registrador 0)
            GPR[writeADDR] <= write_data;
        end
    end

endmodule

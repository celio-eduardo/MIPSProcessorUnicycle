module ProgramCounter #(parameter WSIZE = 32) (
    input wire clock,
    input wire reset,
    input wire write_enable,
    input wire [WSIZE-1:0] data,
    output reg [WSIZE-1:0] output
);

    // Sinal interno para o contador
    reg [WSIZE-1:0] counter;

    // Atribuição do sinal interno à saída
    assign output = counter;

    // Lógica síncrona
    always @(negedge clock or posedge reset) begin
        if (reset) begin
            // Reset: zera o contador
            counter <= {WSIZE{1'b0}};
        end
        else if (write_enable) begin
            // Atualiza o contador com o valor de entrada
            counter <= data;
        end
    end

endmodule

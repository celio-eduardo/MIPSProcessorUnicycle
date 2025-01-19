module NibbleDisplay (
    input wire [3:0] nibble,
    output reg [0:6] display_code
);

    // Lógica de decodificação do nibble para o display de 7 segmentos
    always @(*) begin
        case (nibble)
            4'b0000: display_code = 7'b0000001; // 0
            4'b0001: display_code = 7'b1001111; // 1
            4'b0010: display_code = 7'b0010010; // 2
            4'b0011: display_code = 7'b0000110; // 3
            4'b0100: display_code = 7'b1001100; // 4
            4'b0101: display_code = 7'b0100100; // 5
            4'b0110: display_code = 7'b0100000; // 6
            4'b0111: display_code = 7'b0001111; // 7
            4'b1000: display_code = 7'b0000000; // 8
            4'b1001: display_code = 7'b0001100; // 9
            4'b1010: display_code = 7'b0001000; // A
            4'b1011: display_code = 7'b1100000; // B
            4'b1100: display_code = 7'b0110001; // C
            4'b1101: display_code = 7'b1000010; // D
            4'b1110: display_code = 7'b0110000; // E
            4'b1111: display_code = 7'b0111000; // F
            default: display_code = 7'b1111111; // Outros (todos os segmentos apagados)
        endcase
    end

endmodule

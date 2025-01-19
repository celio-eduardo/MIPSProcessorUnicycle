module MIPS_Exception_Controller #(parameter WSIZE = 32) (
    input wire overflow,
    input wire unknown_opcode,
    output wire [WSIZE-1:0] exception_ADDR,
    output wire exception
);

    // Sinal interno para o endereço curto
    reg [11:0] short_ADDR;

    // Lógica para o endereço de exceção
    assign exception_ADDR = {{(WSIZE-12){1'b0}}, short_ADDR}; // Extensão de 12 bits para WSIZE bits

    // Lógica para o sinal de exceção
    assign exception = (overflow || unknown_opcode) ? 1'b1 : 1'b0;

    // Lógica para o endereço curto
    always @(*) begin
        if (unknown_opcode)
            short_ADDR = 12'h3F0;
        else if (overflow)
            short_ADDR = 12'h3F8;
        else
            short_ADDR = 12'h000;
    end

endmodule

module ULA (
    input wire clk,          // Clock adicionado
    input wire [3:0] ULAopcode,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] R,
    output reg Z,
    output reg O
);
	 reg [31:0] HI;
	 reg [31:0] LO;
    reg [31:0] sub_slt;
    reg [31:0] result;
    reg overflow;

    // Atualização de HI e LO na borda do clock
    always @(posedge clk) begin
        case (ULAopcode)
            // MULT
            4'b1000: {HI, LO} <= A * B;

            // DIV
            4'b1001: begin
                LO <= A / B;
                HI <= A % B;
            end

            // Mantém valores se não for MULT/DIV
            default: {HI, LO} <= {HI, LO};
        endcase
    end

    // Lógica combinacional para operações
    always @(*) begin
        case (ULAopcode)
            // AND
            4'b0000: begin
                result = A & B;
                overflow = 1'b0;
            end

            // OR
            4'b0001: begin
                result = A | B;
                overflow = 1'b0;
            end

            // Add
            4'b0010: begin
                result = A + B;
                overflow = ((A[31] ~^ B[31]) & (A[31] ^ result[31]));
            end

            // Sub
            4'b0110: begin
                result = A - B;
                overflow = ((A[31] ~^ ~B[31]) & (A[31] ^ result[31]));
            end

            // Slt
            4'b0111: begin
                sub_slt = A - B;
                result = {{31'b0}, sub_slt[31]};
                overflow = 1'b0;
            end

            // NOR
            4'b1100: begin
                result = ~(A | B);
                overflow = 1'b0;
            end

            // XOR
            4'b1101: begin
                result = A ^ B;
                overflow = 1'b0;
            end

            // LUI
            4'b1110: begin
                result = {B[15:0], 16'b0};
                overflow = 1'b0;
            end

            // MFLO
            4'b1010: begin
                result = LO; // Valor de LO (atualizado no clock anterior)
                overflow = 1'b0;
            end

            // MFHI
            4'b1011: begin
                result = HI; // Valor de HI (atualizado no clock anterior)
                overflow = 1'b0;
            end

            default: begin
                result = 32'b0;
                overflow = 1'b0;
            end
        endcase

        O = overflow;
        R = result;
        Z = (result == 32'b0); // Z baseado no resultado
    end

endmodule
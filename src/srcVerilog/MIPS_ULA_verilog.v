module MIPS_ULA #(parameter WSIZE = 32) (
    input wire [3:0] opcode,
    input wire [WSIZE-1:0] A,
    input wire [WSIZE-1:0] B,
    output reg [WSIZE-1:0] R,
    output reg Z,
    output reg O
);

    // Sinais internos
    reg [WSIZE-1:0] result;
    reg overflow;

    // Lógica da ULA
    always @(*) begin
        case (opcode)
            // Bitwise AND
            4'b0000: begin
                result = A & B;
                overflow = 1'b0;
            end

            // Bitwise OR
            4'b0001: begin
                result = A | B;
                overflow = 1'b0;
            end

            // Soma com overflow
            4'b0010: begin
                result = A + B;
                overflow = ((A[WSIZE-1] ~^ B[WSIZE-1]) & (A[WSIZE-1] ^ result[WSIZE-1]));
            end

            // Soma sem overflow
            4'b0011: begin
                result = A + B;
                overflow = 1'b0;
            end

            // Subtração com overflow
            4'b0100: begin
                result = A - B;
                overflow = ((A[WSIZE-1] ~^ ~B[WSIZE-1]) & (A[WSIZE-1] ^ result[WSIZE-1]));
            end

            // Subtração sem overflow
            4'b0101: begin
                result = A - B;
                overflow = 1'b0;
            end

            // Set on less than (signed)
            4'b0110: begin
                if ($signed(B) > $signed(A)) begin
                    result = {31'b0, 1'b1};
                end else begin
                    result = 32'b0;
                end
                overflow = 1'b0;
            end

            // Set on less than (unsigned)
            4'b0111: begin
                if (B > A) begin
                    result = {31'b0, 1'b1};
                end else begin
                    result = 32'b0;
                end
                overflow = 1'b0;
            end

            // Bitwise NOR
            4'b1000: begin
                result = ~(A | B);
                overflow = 1'b0;
            end

            // Bitwise XOR
            4'b1001: begin
                result = A ^ B;
                overflow = 1'b0;
            end

            // Shift left logical
            4'b1010: begin
                result = B << A;
                overflow = 1'b0;
            end

            // Shift right logical
            4'b1011: begin
                result = B >> A;
                overflow = 1'b0;
            end

            // Shift right arithmetic
            4'b1100: begin
                result = $signed(B) >>> A;
                overflow = 1'b0;
            end

            // Rotate right
            4'b1101: begin
                result = (B >> A) | (B << (WSIZE - A));
                overflow = 1'b0;
            end

            // Rotate left
            4'b1110: begin
                result = (B << A) | (B >> (WSIZE - A));
                overflow = 1'b0;
            end

            // Unknown OPCODE
            default: begin
                result = 32'b0;
                overflow = 1'b0;
            end
        endcase
    end

    // Lógica de saída
    always @(*) begin
        O = overflow;
        if (overflow == 1'b0) begin
            R = result;
        end else begin
            R = 32'b0;
        end

        if (result == 32'b0 || overflow == 1'b1) begin
            Z = 1'b1;
        end else begin
            Z = 1'b0;
        end
    end

endmodule

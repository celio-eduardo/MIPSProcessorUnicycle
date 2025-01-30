module MIPS_ULA (
    input wire [3:0] ULAopcode,
    input wire [31:0] A,
    input wire [31:0] B,
	 input clock,
    output reg [31:0] R,
    output reg Z,
    output reg O
);

    // Sinais internos
    reg [31:0] result;
    reg overflow;

    // Lógica da ULA
    always @(posedge clock) begin
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

            // Addu
            4'b0011: begin
                result = A + B;
                overflow = 1'b0;
            end

            // Sub
            4'b0100: begin
                result = A - B;
                overflow = ((A[31] ~^ ~B[31]) & (A[31] ^ result[31]));
            end

            // Subu
            4'b0101: begin
                result = A - B;
                overflow = 1'b0;
            end

            // Slt
            4'b0110: begin
                if ($signed(B) > $signed(A)) begin
                    result = {31'b0, 1'b1};
                end else begin
                    result = 32'b0;
                end
                overflow = 1'b0;
            end

            // sltu
            4'b0111: begin
                if (B > A) begin
                    result = {31'b0, 1'b1};
                end else begin
                    result = 32'b0;
                end
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
        end 
		  else begin
            R = 32'b0;
        end

        if ((A - B) == 32'b0) begin
            Z = 1'b1;
        end 
		  else begin
            Z = 1'b0;
        end
    end

endmodule
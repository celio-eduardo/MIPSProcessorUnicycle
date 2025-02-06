module ULA (
    input wire [3:0] ULAopcode,
    input wire [31:0] A,
    input wire [31:0] B,
    output reg [31:0] R,
    output reg Z,
    output reg O
);

    // Sinais internos
	 reg [31:0] sub_slt;
    reg [31:0] result;
    reg overflow;

    // Lógica da ULA
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
					 // Ainda falta lidar com o overflow
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
                result = ~A | ~B;
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
        R = result;

        if ((A - B) == 32'b0) begin
            Z = 1'b1;
        end 
		  else begin
            Z = 1'b0;
        end
    end

endmodule
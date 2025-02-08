module Controle_ULA  (
    input wire [2:0] OpULA,
    input wire [5:0] Funct,
    output reg [3:0] ULAopcode,
	 output reg Unsigned,
	 output reg Jr
);

    // Controle da ULA
    always @(OpULA or Funct) begin
		case(OpULA) // Tipo R 
			3'b000: begin
				case(Funct)
				   // ADD
					6'b100000: begin
						ULAopcode = 4'b0010;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// SUB
					6'b100010: begin
						ULAopcode = 4'b0110;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// ADDU
					6'b100001: begin
						ULAopcode = 4'b0010;
						Jr = 1'b0;
						Unsigned = 1'b1;
					end
					// SUBU
					6'b100011: begin
						ULAopcode = 4'b0110;
						Jr = 1'b0;
						Unsigned = 1'b1;
					end
					// AND
					6'b100100: begin
						ULAopcode = 4'b0000;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// OR
					6'b100101: begin
						ULAopcode = 4'b0001;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// NOR
					6'b100111: begin
						ULAopcode = 4'b1100;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// XOR
					6'b100110: begin
						ULAopcode = 4'b1101;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// SLT
					6'b101010: begin
						ULAopcode = 4'b0111;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// SLL
					6'b000000: begin
						ULAopcode = 4'b0011;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// SLR
					6'b000010: begin
						ULAopcode = 4'b0100;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// MULT
					6'b011000: begin
						ULAopcode = 4'b1000;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// DIV
					6'b011010: begin
						ULAopcode = 4'b1001;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// MFLO
					6'b010000: begin
						ULAopcode = 4'b1010;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// MFHI
					6'b010010: begin
						ULAopcode = 4'b1011;
						Jr = 1'b0;
						Unsigned = 1'b0;
					end
					// JR
					6'b001000: begin
						ULAopcode = 4'b0010;
						Jr = 1'b1;
						Unsigned = 1'b0;
					end
				endcase
			end
			// Tipos I
			//ADDI
			3'b100: begin
				ULAopcode = 4'b0010;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
			//ANDI
			3'b101: begin
				ULAopcode = 4'b0000;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
			//ORI
			3'b110: begin
				ULAopcode = 4'b0001;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
			//XORI
			3'b111: begin
				ULAopcode = 4'b1101;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
			//LUI
			3'b001: begin
				ULAopcode = 4'b1110;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
			// Tipo Branch
			3'b010: begin
				ULAopcode = 4'b0110;
				Jr = 1'b0;
				Unsigned = 1'b0;
			end
		endcase
    end

endmodule
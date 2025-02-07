module Controle_ULA  (
    input wire [2:0] OpULA,
    input wire [5:0] Funct,
    output reg [3:0] ULAopcode
);

    // Controle da ULA
    always @(OpULA or Funct) begin
		case(OpULA) // Tipo R 
			3'b000: begin
				case(Funct)
				   // ADD
					6'b100000: begin
						ULAopcode = 4'b0010;
					end
					// SUB
					6'b100010: begin
						ULAopcode = 4'b0110;
					end
					// AND
					6'b100100: begin
						ULAopcode = 4'b0000;
					end
					// OR
					6'b100101: begin
						ULAopcode = 4'b0001;
					end
					// NOR
					6'b100111: begin
						ULAopcode = 4'b1100;
					end
					// XOR
					6'b100110: begin
						ULAopcode = 4'b1101;
					end
					// SLT
					6'b101010: begin
						ULAopcode = 4'b0111;
					end
					// MULT
					6'b011000: begin
						ULAopcode = 4'b1000;
					end
					// DIV
					6'b011010: begin
						ULAopcode = 4'b1001;
					end
					// MFLO
					6'b010000: begin
						ULAopcode = 4'b1010;
					end
					// MFHI
					6'b010010: begin
						ULAopcode = 4'b1011;
					end
				endcase
			end
			// Tipos I
			//ADDI
			3'b100: begin
				ULAopcode = 4'b0010;
			end
			//ANDI
			3'b101: begin
				ULAopcode = 4'b0000;
			end
			//ORI
			3'b110: begin
				ULAopcode = 4'b0001;
			end
			//XORI
			3'b111: begin
				ULAopcode = 4'b1101;
			end
			//LUI
			3'b001: begin
				ULAopcode = 4'b1110;
			end
			// Tipo Branch
			3'b010: begin
				ULAopcode = 4'b0110;
			
			end
		endcase
    end

endmodule
module Controladora  (
    input wire [5:0] Op,
	 output reg OrigUla,
	 output reg RegDst,
	 output reg MemparaReg,
	 output reg EscreveReg,
	 output reg EscreveMem,
	 output reg Jump,
	 output reg Jal,
	 output reg Branch,
	 output reg BNE,
	 output reg [2:0]OpULA,
	 output reg UnknownOpcode
);

    // Controle da ULA
    always @(Op) begin
       case(Op) // Tipo R 
			6'b000000: begin
                OrigUla = 0;
					 RegDst = 1;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b000;
					 UnknownOpcode = 0;
            end 
			// Tipo I's
			// Lui
			6'b001111: begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b001;
					 UnknownOpcode = 0;
			end
			// Addi
			6'b001000: begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b100;
					 UnknownOpcode = 0;
			end
			// Andi
			6'b001100: begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b101;
					 UnknownOpcode = 0;
			end
			
			// Ori
			6'b001101: begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b110;
					 UnknownOpcode = 0;
			end
			
			// Xori
			6'b001110: begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b111;
					 UnknownOpcode = 0;
			end
			
			// Tipo LW
			6'b100011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 1;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b100;
					 UnknownOpcode = 0;
            end
			// Tipo SW
			6'b101011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 1;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b100;
					 UnknownOpcode = 0;
            end
			// Tipo Branch
			6'b000100: begin
                OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 1;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b010;
					 UnknownOpcode = 0;
            end
			// BNE
			6'b000101: begin
                OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 1;
					 BNE = 1;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b010;
					 UnknownOpcode = 0;
            end
			// Tipo J
			6'b000010: begin
					 OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 1;
					 Jal = 0;
					 OpULA = 3'b000;
					 UnknownOpcode = 0;
				end
			// JAL
			6'b000011: begin
					 OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 1;
					 Jal = 1;
					 OpULA = 3'b000;
					 UnknownOpcode = 0;
			end
			// UNKNOWN OPCODE
			default: begin
					 OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 0;
					 BNE = 0;
					 Jump = 0;
					 Jal = 0;
					 OpULA = 3'b000;
					 UnknownOpcode = 1;
			end
		 endcase
    end

endmodule
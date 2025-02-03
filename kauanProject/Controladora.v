module Controladora  (
    input wire [5:0] Op,
	 output reg OrigUla,
	 output reg RegDst,
	 output reg MemparaReg,
	 output reg EscreveReg,
	 output reg EscreveMem,
	 output reg Jump,
	 output reg Branch,
	 output reg [1:0]OpULA
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
					 Jump = 0;
					 OpULA = 2'b10;
            end 
			// Tipo I's
			6'b001000, 6'b001100, 6'b001101, 6'b001110:
			begin
					 OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 Jump = 0;
					 OpULA = 2'b10;
			end
			// Tipo LW
			6'b100011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 1;
					 EscreveReg = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 Jump = 0;
					 OpULA = 2'b00;
            end
			// Tipo SW
			6'b101011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 1;
					 Branch = 0;
					 Jump = 0;
					 OpULA = 2'b00;
            end
			// Tipo Branch
			6'b000100: begin
                OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 1;
					 Jump = 0;
					 OpULA = 2'b01;
            end
			// Tipo J
			6'b000010: begin
					 OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 EscreveMem = 0;
					 Branch = 0;
					 Jump = 1;
					 OpULA = 2'b00;
			end
		 endcase
    end

endmodule
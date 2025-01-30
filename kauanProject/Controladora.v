module Controladora  (
    input wire [5:0] Op,
	 output reg OrigUla,
	 output reg RegDst,
	 output reg MemparaReg,
	 output reg EscreveReg,
	 output reg LeMem,
	 output reg EscreveMem,
	 output reg Branch,
	 output reg [1:0] OpULA
);

    // Controle da ULA
    always @(Op) begin
       case(Op) 
			6'b000000: begin
                OrigUla = 0;
					 RegDst = 1;
					 MemparaReg = 0;
					 EscreveReg = 1;
					 LeMem = 0;
					 EscreveMem = 0;
					 Branch = 0;
					 OpULA = 2'b10;
            end
			6'b100011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 1;
					 EscreveReg = 1;
					 LeMem = 1;
					 EscreveMem = 0;
					 Branch = 0;
					 OpULA = 2'b00;
            end
			6'b101011: begin
                OrigUla = 1;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 LeMem = 0;
					 EscreveMem = 1;
					 Branch = 0;
					 OpULA = 2'b00;
            end
			6'b000100: begin
                OrigUla = 0;
					 RegDst = 0;
					 MemparaReg = 0;
					 EscreveReg = 0;
					 LeMem = 0;
					 EscreveMem = 0;
					 Branch = 1;
					 OpULA = 2'b01;
            end
		 endcase
    end

endmodule
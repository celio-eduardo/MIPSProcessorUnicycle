module Controle_ULA  (
    input wire [1:0] OpULA,
    input wire [5:0] Funct,
    output reg [3:0] ULAopcode
);

    // Controle da ULA
    always @(OpULA or Funct) begin
       ULAopcode[3] = 0;
		 ULAopcode[2] = OpULA[0] || (OpULA[1] && Funct[1]);
		 ULAopcode[1] = ~OpULA[1] || ~Funct[2];
		 ULAopcode[0] = OpULA[1] && (Funct[3] || Funct[0]);
    end

endmodule
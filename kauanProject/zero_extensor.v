module zero_extensor (input wire [15:0] imm,
								output [31:0] extended_imm);
			
	assign extended_imm[15:0] = imm[15:0];
	assign extended_imm[31:16] = {16{1'b0}};
	
endmodule

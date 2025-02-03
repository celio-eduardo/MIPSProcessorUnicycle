module BancoReg(
    input clk,
    input RegWrite,
    input [4:0] read_reg1, read_reg2, write_reg,
    input [31:0] write_data,
    output [31:0] data1, data2
);

    reg [31:0] registers[0:31];
	 
	 assign data1 = (read_reg1 == 5'b0) ? 32'b0 : registers[read_reg1];
	 assign data2 = (read_reg2 == 5'b0) ? 32'b0 : registers[read_reg2];

    // Escrita síncrona (apenas se RegWrite=1 e write_reg≠0)
    always @(posedge clk) begin
        if (RegWrite) begin
            registers[write_reg] <= write_data;
        end
		  
    end

endmodule
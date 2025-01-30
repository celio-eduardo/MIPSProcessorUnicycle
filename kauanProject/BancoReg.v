module BancoReg(
    input clk,
    input reset,
    input RegWrite,
    input [4:0] read_reg1, read_reg2, write_reg,
    input [31:0] write_data,
    output reg [31:0] data1, data2
);

    reg [31:0] registers[0:31];

    // Escrita síncrona
    always @(posedge clk) begin
		  data1 <= registers[read_reg1];
		  data2 <= registers[read_reg2];
		  if (RegWrite && write_reg != 0) begin
            registers[write_reg] <= write_data;
        end
    end

endmodule
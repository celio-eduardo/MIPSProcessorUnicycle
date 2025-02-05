module BancoReg(
    input clk,
    input RegWrite,
    input [4:0] read_reg1, read_reg2, write_reg,
    input [31:0] write_data,
    output [31:0] data1, data2,
	 output [31:0] zero,
	 output [31:0] at,
	 output [31:0] v0,
	 output [31:0] v1,
	 output [31:0] a0,
	 output [31:0] a1,
	 output [31:0] a2,
	 output [31:0] a3,
	 output [31:0] t0,
	 output [31:0] t1,
	 output [31:0] t2,
	 output [31:0] t3,
	 output [31:0] t4,
	 output [31:0] t5,
	 output [31:0] t6,
	 output [31:0] t7,
	 output [31:0] s0,
	 output [31:0] s1,
	 output [31:0] s2,
	 output [31:0] s3,
	 output [31:0] s4,
	 output [31:0] s5,
	 output [31:0] s6,
	 output [31:0] s7,
	 output [31:0] t8,
	 output [31:0] t9,
	 output [31:0] kt0,
	 output [31:0] kt1,
	 output [31:0] gp,
	 output [31:0] sp,
	 output [31:0] s8,
	 output [31:0] ra
);

    reg [31:0] registers[0:31];
	 
	 assign zero = registers[0];
	 assign at = registers[1];
	 assign v0 = registers[2];
	 assign v1 = registers[3];
	 assign a0 = registers[4];
	 assign a1 = registers[5];
	 assign a2 = registers[6];
	 assign a3 = registers[7];
	 assign t0 = registers[8];
	 assign t1 = registers[9];
	 assign t2 = registers[10];
	 assign t3 = registers[11];
	 assign t4 = registers[12];
	 assign t5 = registers[13];
	 assign t6 = registers[14];
	 assign t7 = registers[15];
	 assign s0 = registers[16];
	 assign s1 = registers[17];
	 assign s2 = registers[18];
	 assign s3 = registers[19];
	 assign s4 = registers[20];
	 assign s5 = registers[21];
	 assign s6 = registers[22];
	 assign s7 = registers[23];
	 assign t8 = registers[24];
	 assign t9 = registers[25];
	 assign kt0 = registers[26];
	 assign kt1 = registers[27];
	 assign gp = registers[28];
	 assign sp = registers[29];
	 assign s8 = registers[30];
	 assign ra = registers[31];
	 
	 assign data1 = (read_reg1 == 5'b0) ? 32'b0 : registers[read_reg1];
	 assign data2 = (read_reg2 == 5'b0) ? 32'b0 : registers[read_reg2];
    always @(posedge clk) begin
        if (RegWrite) begin
            registers[write_reg] <= write_data;
        end
		  
    end

endmodule
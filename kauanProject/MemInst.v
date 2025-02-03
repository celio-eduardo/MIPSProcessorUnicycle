module MemInst(
    input [11:0] PC,
    output [31:0] IR
);

	 reg [31:0] rom [0:4095];
    initial begin
        $readmemh("TEXT.mif", rom);
    end

    assign IR = rom[PC];

endmodule
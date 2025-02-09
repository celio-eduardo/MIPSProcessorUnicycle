module mfsreg(
    input en,
    input [31:0] mflo_in,
	 input [31:0] mfhi_in,
	 output [31:0] mflo_out,
	 output [31:0] mfhi_out
);

    reg [31:0] mflo;
	 reg [31:0] mfhi;
	 assign mflo_out = mflo;
	 assign mfhi_out = mfhi;
    always @(*) begin
        if (en) begin
            mflo <= mflo_in;
				mfhi <= mfhi_in;
        end
    end

endmodule
module div_freq( 
		input wire mini_clock,
		output wire clock
);
reg [2:0] i;
initial begin
	i <= 0;
end
always @(posedge mini_clock) begin
	i <= i + 1;
end
assign clock = i[2];
endmodule
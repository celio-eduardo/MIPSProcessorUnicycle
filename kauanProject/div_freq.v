module div_freq( 
		input mini_clock,
		output reg clock
);
integer i;
initial begin
	i = 0;
end
always @(posedge mini_clock) begin
	if (i == 2) begin
		clock <= 1'b1;
		i = 0;
	end
	else begin
		clock <= 1'b0;
		i = i + 1;
	end
end
endmodule
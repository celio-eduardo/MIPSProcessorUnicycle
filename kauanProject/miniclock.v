module miniclock ( input in,                 
                  output reg out);
	 initial begin
	  out <= 0;
	 end
	 always @ (*) begin
      out <= ~in;
   end
endmodule
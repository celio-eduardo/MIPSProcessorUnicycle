module shift_left_2 ( input wire [31:0] PC,                           
                  output reg [31:0] out);         

   always @ (PC) begin
		out = PC << 2;
   end
endmodule
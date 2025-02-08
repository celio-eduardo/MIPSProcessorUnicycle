module mux_3to1 ( input wire [31:0] a,                 
                  input wire [31:0] b,
						input wire [31:0] c,
                  input wire [1:0] sel,               
                  output reg [31:0] out);         

   always @ (a or b or sel) begin
      case (sel)
         2'b00 : out <= a;
         2'b01 : out <= b;
			2'b10 : out <= c;
			default: out <= 0;
      endcase
   end
endmodule
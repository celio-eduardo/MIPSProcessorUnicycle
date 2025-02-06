module mux_2to1Reg ( input wire [4:0] a,                 
                  input wire [4:0] b,                           
                  input wire sel,               
                  output reg [4:0] out);         

   always @ (a or b or sel) begin
      case (sel)
         1'b0 : out <= a;
         1'b1 : out <= b;
      endcase
   end
endmodule
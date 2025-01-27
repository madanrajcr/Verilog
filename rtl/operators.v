module operators(code,a,b,result);
  input [3:0] code;
  input [7:0] a;
  input [7:0] b;
  output reg [7:0] result;

  always @(*)
  begin
    case (code)
      // Arithmetic operators
      4'b0000: result = a + b; // Addition
      4'b0001: result = a - b; // Subtraction
      4'b0010: result = a * b; // Multiplication
      4'b0011: result = a/b; // Division
      
      // Logical operators
      4'b0100: result = a&b; // Bitwise AND
      4'b0101: result = a |b; // Bitwise OR
      4'b0110: result = a ^ b; // Bitwise XOR
      
      // Bitwise NOT
      4'b0111: result = ~a;
      
      // Default case
      default: result = 8'b0;
    endcase
    
   
  end
endmodule

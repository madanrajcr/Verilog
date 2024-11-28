module operators_tb;
  
  reg [3:0] code;
  reg [7:0] a;
  reg [7:0] b;
  wire [7:0] result;
  
  
  operators dut (
    .code(code),
    .a(a),
    .b(b),
    .result(result)
  );
  
  initial
  begin
    // Test case 1: Addition
    code = 4'b0000;
    a = 8'b00001010;
    b = 8'b00000110;
    #10;
    $display("Addition Result: %d", result);
    
    // Test case 2: Bitwise AND
    code = 4'b0100;
    a = 8'b00101011;
    b = 8'b11001100;
    #10;
    $display("Bitwise AND Result: %d", result);
    
    // Test case 3: Logical OR
    code = 4'b0101;
    a = 8'b00101011;
    b = 8'b11001100;
    #10;
    $display("Logical OR Result: %d", result);
    
    // Test case 4: Bitwise XOR
    code = 4'b0110;
   a = 8'b00101011;
    b = 8'b11001100;
    #10;
    $display("Bitwise XOR Result: %d", result);
    
    // Test case 5: Bitwise NOT
    code = 4'b0111;
    a = 8'b00101011;
    #10;
    $display("Bitwise NOT Result: %d", result);
    
 
    
    $finish;
  end
endmodule

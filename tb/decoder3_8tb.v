module Decoder3to8_TB;
 reg [2:0] input;
 wire [7:0] output;
Decoder3to8 dut (
 .input(input),
 .output(output)
 );
 initial begin
 $monitor("Input: %b, Output: %b", input, output);
 
 // Test all possible inputs
 input = 3'b000; #10;
 input = 3'b001; #10;
 input = 3'b010; #10;
 input = 3'b011; #10;
 input = 3'b100; #10;
 input = 3'b101; #10;
 input = 3'b110; #10;
 input = 3'b111; #10;
 
 $finish;
 end
endmodule

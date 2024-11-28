module Decoder3to8(
 input [2:0] input,
 output [7:0] output
);
 reg [7:0] decoder_output;
 always @(input)
 case (input)
 3'b000: decoder_output = 8'b00000001;
 3'b001: decoder_output = 8'b00000010;
 3'b010: decoder_output = 8'b00000100;
 3'b011: decoder_output = 8'b00001000;
 3'b100: decoder_output = 8'b00010000;
 3'b101: decoder_output = 8'b00100000;
 3'b110: decoder_output = 8'b01000000;
 3'b111: decoder_output = 8'b10000000;
 default: decoder_output = 8'b00000000;
 endcase
 assign output = decoder_output;
endmodule

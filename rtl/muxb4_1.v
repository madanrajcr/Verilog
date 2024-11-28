module muxb4_1 (
 input [4:0] data_in,
 input [1:0] sel,
 output reg data_out
);
always @(*)
begin
 case(sel)
 2'b00: data_out = data_in[0];
 2'b01: data_out = data_in[1];
 2'b10: data_out = data_in[2];
 2'b11: data_out = data_in[3];
 default: data_out = 8'b0; 
 endcase
end
endmodule
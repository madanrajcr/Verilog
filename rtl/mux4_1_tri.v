module mux4_1_tri(in,s,y); 
input [3:0]in; 
input [1:0]s; 
output wor y; 
wire [3:0]w; 
wire [3:0]x; 
decoder2_4 d1(s,w); 
bufif1 b1(x[0],in[0],w[0]); 
bufif1 b2(x[1],in[1],w[1]); 
bufif1 b3(x[2],in[2],w[2]); 
bufif1 b4(x[3],in[3],w[3]); 
assign y=x[0]; 
assign y=x[1]; 
assign y=x[2]; 
assign y=x[3]; 
endmodule 
module decoder2_4(in,out); 
output [3:0] out; 
input [1:0] in; 
assign out[0] = (~in[0]) & (~in[1]); 
assign out[1] = (~in[0]) & in[1]; 
assign out[2] = in[0] & (~in[1]); 
assign out[3] = in[0] & in[1]; 
endmodule 
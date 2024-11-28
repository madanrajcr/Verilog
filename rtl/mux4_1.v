module mux4_1(out,i0,i1,i2,i3,s1,s0); 
input i0,i1,i2,i3,s1,s0; 
output out; 
wire mux1,mux2; 
mux2_1 mux_1(s1,i0,i1,mux1); 
mux2_1 mux_2(s1,i2,i3,mux2); 
mux2_1 mux_3(s0,mux1,mux2,out); 
endmodule 
module mux2_1 (input S, A, B, output Y); 
assign Y = (S & B) | (~S & A); 
endmodule 
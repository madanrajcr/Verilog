module pr_encoder(in,idle,y); 
input [7:0]in; 
output[2:0]y; 
output idle; 
wire [7:0]h; 
pr_circuit c1(in,h,idle); 
encoder c2(h,y); 
endmodule 
module pr_circuit(i,h,idle); 
input [7:0]i; 
output [7:0]h; 
output idle; 
assign h[7]=i[7]; 
assign h[6]=i[6]&~i[7]; 
assign h[5]=i[5]&~i[6]&~i[7]; 
assign h[4]=i[4]&~i[5]&~i[6]&~i[7]; 
assign h[3]=i[3]&~i[4]&~i[5]&~i[6]&~i[7]; 
assign h[2]=i[2]&~i[3]&~i[4]&~i[5]&~i[6]&~i[7]; 
assign h[1]=i[1]&~i[2]&~i[3]&~i[4]&~i[5]&~i[6]&~i[7]; 
assign h[0]=i[0]&~i[1]&~i[2]&~i[3]&~i[4]&~i[5]&~i[6]&~i[7]; 
assign idle=~i[0]&~i[1]&~i[2]&~i[3]&~i[4]&~i[5]&~i[6]&~i[7]; 
endmodule 
module encoder(in,y); 
input [7:0]in; 
output [2:0]y; 
assign y[2]=in[4]+in[5]+in[6]+in[7]; 
assign y[1]=in[2]+in[3]+in[6]+in[7]; 
assign y[0]=in[1]+in[3]+in[5]+in[7]; 
endmodule
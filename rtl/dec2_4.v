module dec2_4(a,b,w,x,y,z);
output w,x,y,z;
input a,b;
assign w = (~a)&(~b);
assign x = (~a)&b;
assign y = a&(~b);
assign z = a&b;
endmodule
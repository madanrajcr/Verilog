module mynew_or(y,a,b);
input a,b;
output y;
wire c1,c2;
not n1(c1,a);
not n2(c2,b);
nand n3(y,c1,c2);
endmodule
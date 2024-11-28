module T_FF2(clk,rst,T,Q,Qb);
input clk,rst,T;
inout Q;
output Qb;
wire d_in;
xor D1(d_in,T,Q);
dff2 D2 (clk,rst,d_in,Q,Qb);
endmodule
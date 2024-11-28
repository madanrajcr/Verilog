module jkff2_tb;
reg J;
reg K;
reg CLK;
wire Q;
jkff2 DUT(
.J(J),
.K(K),
.CLK(CLK),
.Q(Q)
);
always 
begin
#5CLK=~CLK;
end
initial 
begin
J=0;
K=0;
CLK=0;
#10J=1;K=0;
#20J=0;K=0;
#10J=0;K=1;
#20J=1;K=1;
#10J=0;K=0;
#100$finish;
end
always@(posedge CLK)begin
$display("Q=%b"
,Q);
end
endmodule
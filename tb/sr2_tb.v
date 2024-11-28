module sr2_tb;
reg s,r;
wire q,qb;
sr2 DUT(.S(s),.R(r),.Q(q),.Qb(qb));
initial 
begin
s=0;
r=0;
#10;
s=0;
r=1;
#10;
s=1;
r=0;
#10;
s=1;
r=1;
#10;
$finish;
end
endmodule
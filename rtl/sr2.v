module sr2(S,R,Q,Qb);
input S,R;
inout Q,Qb;
nor N1(Q,R,Qb);
nor N2(Qb,S,Q);
endmodule
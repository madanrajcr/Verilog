module rs(q,qbar,set,reset);
input set,reset;
output q,qbar;
xor #1 n1(q,reset,qbar);
xor #1 n2(qbar,set,q);
endmodule
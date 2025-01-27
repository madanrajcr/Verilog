module upcounter4_tb;
reg CLK;
reg LOAD;
reg[3:0]DATA;
wire[3:0]Q;
upcounter4 Counter(
.CLK(CLK),
.LOAD(LOAD),
.DATA(DATA),
.Q(Q)
);
always
begin
#5CLK=~CLK;
end
initial
begin
CLK=0;
LOAD=0;
DATA=4'b0000;
#10LOAD=1;
#5DATA=4'b1010;
#10LOAD=0;
#20LOAD=1;
#5DATA=4'b0011;
#10LOAD=0;
#100$finish;
end
always@(posedge CLK)begin
$display("Q=%b"
,Q);
end
endmodule
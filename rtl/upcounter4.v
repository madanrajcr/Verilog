module upcounter4(
input  CLK,
input LOAD,
input [3:0] DATA,
output reg[3:0] Q
);
always@(posedge CLK)
begin
if(LOAD)
begin
Q<=DATA;
end
else
begin
Q<=Q+1;
end
end
endmodule
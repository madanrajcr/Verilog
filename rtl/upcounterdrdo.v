module upcounterdrdo(clk,rst_n,cntr);
parameter N=8;
input clk,rst_n;
output reg[N-1:0]cntr;
always@(posedge clk or negedge rst_n)
begin
if(!rst_n)
begin
cntr <={N{1'b0}};
end
else
begin 
cntr<=cntr+1'b1;
end
end
endmodule
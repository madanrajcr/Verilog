module updown(clk,reset,data,max,min);
parameter data_width =32; 
parameter maxmin_width =32;
input clk,reset;
input [data_width - 1:0]data;
output reg[maxmin_width - 1:0]max,min;
integer i;
always @(*)
begin
if(reset)
begin 
   max <= 0;
   min <= 0;
end
else
begin
for(i=0;i<data_width-1;i=i+1)

   if(data[i]==1'b0)

begin
   max = min+3;
end
else
   min = max;
end
end
endmodule

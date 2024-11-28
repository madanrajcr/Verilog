module mod12_up_counter(
input clk,
input load,
output [3:0]out
);
reg[3:0] counter;
always@(posedge clk)begin
if(load)
counter<=4'b0000;
else if(counter == 4'b1011)
counter<=4'b0000;
else
counter<=counter+1;
end
assign out=counter;
endmodule
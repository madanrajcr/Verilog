module syndualport(clk,reset,read,write,data_in,write_address,read_address,data_out);
input clk,reset,read,write;
input [7:0]data_in;
input [3:0]write_address,read_address;
output reg[7:0]data_out;
integer i;

reg [7:0]mem[15:0];
always @(posedge clk)
begin
 if(reset)
 begin
 data_out<=0;
 for(i=0;i<16;i=i+1)
 mem[i]<=0;
 end
else
begin
if(write)
mem[write_address]<=data_in;
if(read)
data_out<=mem[read_address];
end
end
endmodule 
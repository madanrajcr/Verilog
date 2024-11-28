module updown_tb;
parameter data_width=32;
parameter maxmin_width=32;
reg clk,reset;
reg[data_width-1:0]data;
wire[maxmin_width-1:0]A,B;
updown Counter(clk,reset,data,A,B);
always
begin
#5 clk=~clk;
end
task resetsetting;
input clk;
output reset;
begin
# 5 reset=~clk;
end
endtask



initial
begin
clk=0;
reset=1;
# 5 reset=0;
# 10 data=32'10001010101010101000011001010111;
end
always@(posedge clk)
begin
$display("A=%b,B=%b",A,B);
end
endmodule
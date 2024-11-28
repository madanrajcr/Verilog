module mynew_or_tb();
reg a,b;
wire y;
my_or dut(y,a,b)
initial
begin
a=0;b=0;
#5 a=1;b=0;
#10 a=0;b=1;
#15 a=1;b=1;
end
endmodule
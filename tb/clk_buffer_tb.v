module clk_buffer_tb();
reg mclk;
wire bclk;
clk_buffer dut(mclk,bclk);
reg p,f;
time t1,t2,t3,t4,t5,t6;
initial
begin
mclk=1'b0;
end
always #10 mclk=~mclk;
task measure_mclk();
begin
@(posedge mclk);
t1=$time;
@(posedge mclk);
t3=$time;
end
endtask
task measure_bclk;
begin
@(posedge bclk);
t2=$time;
@(posedge bclk);
t4=$time;
end
endtask
initial
begin
fork
measure_mclk;
measure_bclk;
join
if((t1==t2)&&(t3==t4))
$display ("phase is same");
else
$display ("phase is not same");

t5 = t3 - t1;
t6 = t4 - t2;
if (t5 == t6)
begin
$display ("frequency is same");
end
else
begin
$display ("frequency is not same");
end
end
endmodule

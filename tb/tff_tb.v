module T_FF2_tb;
reg clk,rst,t;
wire Q,Qb;
T_FF2 DUT(clk,rst,t,Q,Qb);
initial
begin
clk=0;
forever#10clk=~clk;
end
task rst_dut();
begin
@(negedge clk);
rst=1'b1;
@(negedge clk);
rst=1'b0;
end
endtask
task T(input i);
begin
@(negedge clk);
t = i;
end
endtask
initial
begin
rst_dut;
T(0);
T(1);
T(0);
T(1);
T(1);
rst_dut;
T(0);
T(1);
#10;
$finish;
end
endmodule
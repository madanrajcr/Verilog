module mod12_up_counter_tb;
reg clk;
reg load;
wire[3:0]out;
mod12_up_counter dut(
.clk(clk),
.load(load),
.out(out)
);
always 
begin
clk=0;
#5;
clk=1;
#5;
end
initial 
begin
load=0;
#10;
load=1;
#10;
load=0;
#50;
$finish;
end
always@(posedge clk)begin
$display("Counter:%b"
,out);
end
endmodule
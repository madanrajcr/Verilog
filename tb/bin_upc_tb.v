module bin_upc_tb;
reg clk;
reg reset;
reg up_down;
wire[3:0]count;
bin_upc dut(
.clk(clk),
.reset(reset),
.up_down(up_down),
.count(count)
);
initial
begin
clk=0;
reset=1;
up_down=0;
#10reset=0;
end
always
begin
#5clk=~clk;
end
initial
begin
#20up_down=1;
#40up_down=0;
#60$finish;
end
endmodule
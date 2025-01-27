module codingtest_tb();
reg cpu_overheated,arrived,gas_tank_empty;
wire shut_off_computer,keep_driving;

codingtest dut(shut_off_computer,keep_driving,cpu_overheated,arrived,gas_tank_empty);
initial
begin
cpu_overheated=1'b0;arrived=1'b1;gas_tank_empty=1'b0;
#5 cpu_overheated=1'b1;arrived=1'b0;gas_tank_empty=1'b0;
#5 cpu_overheated=1'b0;arrived=1'b0;gas_tank_empty=1'b1;
#5 cpu_overheated=1'b0;arrived=1'b0;gas_tank_empty=1'b0;
#5 cpu_overheated=1'b1;arrived=1'b0;gas_tank_empty=1'b0;
#10 cpu_overheated=1'b1;arrived=1'b1;gas_tank_empty=1'b1;
#10 cpu_overheated=1'b1;arrived=1'b1;gas_tank_empty=1'b1;
#5 cpu_overheated=1'b0;arrived=1'b1;gas_tank_empty=1'b1;



end
endmodule 

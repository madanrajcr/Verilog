module codingtest(shut_off_computer,keep_driving,cpu_overheated,arrived,gas_tank_empty);
input cpu_overheated,arrived,gas_tank_empty;
output reg shut_off_computer,keep_driving;
always @(*)
begin
if(cpu_overheated==1)
begin
  shut_off_computer = 1'b1;
end
if(arrived==0)
begin
if(gas_tank_empty)
 keep_driving=1'b0;
else
 keep_driving=1'b1;
end
else
keep_driving=1'b0;
end
endmodule 
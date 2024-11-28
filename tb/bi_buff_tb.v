module bi_buff_tb(); 
wire a,b; 
reg control; 
reg tempa,tempb; 
integer i; 
bi_buff dut(a,b,control); 
initial 
begin 
 tempa = 1'b0; 
 tempb = 1'b0; 
 control = 1'b0; 
end 
always #10 tempa = ~tempa; 
always #20 tempb = ~tempb; 
always #50 control = ~control; 
assign a = (control == 1)?tempa:1'bz; 
assign b = (control == 0)?tempb:1'bz; 
initial 
begin 
#1000; 
$finish; 
end 
endmodule 
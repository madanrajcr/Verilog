module dec2_4_tb; 
reg a,b; 
wire w,x,y,z; 
dec2_4 DUT1(a,b,w,x,y,z); 
integer i; 
initial 
begin 
for(i=0;i<4;i=i+1) 
begin 
{a,b}=i; 
#10; 
end 
end 
initial 
begin 
$monitor($time,"a=%b,b=%b,w=%b,x=%b,y=%b,z=%b",a,b,w,x,y,z); 
end 
endmodule
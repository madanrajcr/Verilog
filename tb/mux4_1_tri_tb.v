module mux4_1_tri_tb(); 
reg [3:0]in; 
reg [1:0]s; 
wire y; 
integer i; 
mux4_1_tri dut(in,s,y); 
initial 
begin 
for(i=0;i<64;i=i+1) 
begin 
{s,in}=i; 
#10; 
end 
end 
initial #800 $finish; 
endmodule 
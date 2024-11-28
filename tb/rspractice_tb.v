module rspractice_tb; 
// Declarations of wire, reg, and other variables 

wire q, qbar; 
reg set, reset; 
// Instantiate lower-level modules 
// In this case, instantiate SR_latch 
// Feed inverted set and reset signals to the SR latch 
rs m1(q, qbar, ~set, ~reset); 
// Behavioral block, initial 
initial 
begin 
 $monitor($time, " set = %b, reset= %b, q= %b\n",set,reset,q); 
 set = 0; reset = 0; 
 #5 reset = 1; 
 #5 reset = 0; 
 #5 set = 1; 
end 
// endmodule statement 
endmodule 
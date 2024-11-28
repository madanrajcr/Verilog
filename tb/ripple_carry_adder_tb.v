module ripple_carry_adder_tb; 
 reg [3:0] in0; 
 reg [3:0] in1; 
 wire [3:0] out; 
 wire cout; 
 integer i; 
 ripple_carry_adder rca(.in0(in0), .in1(in1), .out(out), .cout(cout)); 
 initial 
 begin 
 for(i=0;i<256;i=i+1) 
 begin 
 {in0,in1}=i; 
 #10; 
 end 
 end 
 initial begin 
 $dumpfile("ripple-carry-adder.vcd"); 
 $dumpvars(0, ripple_carry_adder_tb); 
 $monitor($time, ": %b + %b = %b, %b", in0, in1, out, cout); 
 end 
endmodule
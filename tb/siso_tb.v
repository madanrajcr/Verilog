module siso_tb;
reg clk;
reg reset;
reg serial_in;
reg shift;
wire[3:0]serial_out;
siso dut(
.clk(clk),
.reset(reset),
.serial_in(serial_in),
.shift(shift),
.serial_out(serial_out)
);
initial 
begin
clk=0;
reset=1;
serial_in=0;
shift=0;
#10reset=0;
end
always 
begin
#5clk=~clk;
end
initial 
begin
#20serial_in=1;
#30shift=1;
#40shift=0;
#50serial_in=0;
#60shift=1;
#70shift=0;
#80serial_in=1;
#90shift=1;
#100shift=0;
#110$finish;
end
endmodule
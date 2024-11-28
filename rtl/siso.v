module siso(
input clk,
input reset,
input serial_in,
input shift,
output reg[3:0] serial_out
);
always@(posedge clk or posedge reset)begin
if(reset)
serial_out<=4'b0000;
else if(shift)
serial_out<={serial_out[2:0],serial_in};
end
endmodule
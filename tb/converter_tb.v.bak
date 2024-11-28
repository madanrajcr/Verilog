module converter_tb;
reg [31:0]in;
wire [11:0]out;
integer i;
converter dut(.in(in),.out(out));
initial
begin
for(i=0;i<4294967295;i=i+1)
begin 
in=i;
#3 in=i;
end
end
endmodule
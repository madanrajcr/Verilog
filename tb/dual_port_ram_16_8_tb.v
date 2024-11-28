module dual_port_ram_16_8_tb();

parameter ram_width =8;
parameter ram_depth =16;
parameter addr_size =4;
parameter cycle =10;

reg clk,reset,read,write;
reg [ram_width-1:0] data_in;
reg [addr_size-1:0]rd_addr,wr_addr;
wire [ram_width-1:0]data_out;
integer i;

 dual_ram_16_8 DUT(clk,read,write,reset,rd_addr,wr_addr,data_in,data_out);
 
 
always
	begin
	#(cycle/2) clk=1'b0;
	#(cycle/2) clk=1'b1;
	end
		
task reset_t;
begin@(negedge clk);
reset =1'b1;
@(negedge clk);
reset=1'b0;
end
endtask
	
task write_t(input [7:0]a, input [3:0]b, input w,r);
begin
@ (negedge clk);
write = w;
read = r;
wr_addr = b; 
data_in =a;
end
endtask

task read_t(input [3:0]a, input r,w);
begin
@(negedge clk);
write =w;
read = r;
rd_addr = a;
end
endtask


initial

begin
reset_t;
repeat(10) 
write_t({$random}%256, {$random}%16,1'b1,1'b0);
repeat(10)
read_t({$random}%16,1'b1,1'b0);
#100 $finish;
end
endmodule
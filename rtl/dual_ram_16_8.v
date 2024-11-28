module dual_ram_16_8 (clk,read,write,reset,rd_addr,wr_addr,data_in,data_out);

parameter ram_width =8;
parameter ram_depth =16;
parameter addr_size =4;

input clk,reset,read,write;
input [ram_width-1:0]data_in;
input [addr_size-1:0]rd_addr,wr_addr;
output reg [ram_width-1:0]data_out;
integer i;

reg [ram_width-1:0]mem[ram_depth-1:0];
always@(posedge clk)
	begin
		if(reset)
			begin
			data_out<=0;
				for (i=0;i<ram_depth;i =i+1)
				mem[i]<=0;
			end
		else
			begin 
				if(write)
					mem[wr_addr] <= data_in;
				if(read)
					data_out <= mem[rd_addr];
			end	
	end
endmodule
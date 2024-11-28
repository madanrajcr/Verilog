module router_fifo(clk,resetn,soft_reset,write_enb,read_enb,lfd_state,data_in,full,empty,data_out);

input clk,resetn,soft_reset,write_enb,read_enb,lfd_state;
input [7:0]data_in;
output full,empty;
output reg [7:0]data_out;
reg [3:0]rd_pt,wr_pt;
reg [5:0]count;
reg [8:0]mem[15:0];
integer i;
//fifo down-counter logic
always@(posedge clk)
begin
        if(!resetn)
        begin
                count<=0;
        end
        else if(soft_reset)
        begin
                count<=0;
        end
        else if(read_enb & ~empty)
        begin
        if(mem[rd_pt[3:0]][8]==1'b1)
        count<=mem[rd_pt[3:0]][7:2] +1'b1;
        else if(count != 0)
        count<=count -1'b1;
end
end
// read operation
always@(posedge clk)
begin
        if(!resetn)
        data_out<=8'b00000000;
        else if(soft_reset)
                data_out<=8'bzzzzzzzz;
        else
        begin
                if(count==0 && data_out !=0)
                        data_out<= 8'dz;
                else if(read_enb && ~empty)
                        data_out<= mem[rd_pt[3:0]];

        end
end
//write operation
always@(posedge clk)
begin
        if(!resetn)
        begin
        for(i =0;i<16;i=i+1)
           begin
            mem[i]<=0;
           end
end
else if(soft_reset)
begin
for(i =0;i<16;i=i+1)
begin
 mem[i]<=0;
end
end
else
begin
        if(write_enb && !full)
        {mem[wr_pt[3:0]]}<={lfd_state,data_in};
end
end
// logic for the increment pointer
always @( posedge clk)
begin
        if(!resetn)
        begin
                rd_pt<=5'b00000;
                wr_pt<= 5'b00000;
        end
else if(soft_reset)
begin
rd_pt<=5'b00000;
wr_pt<=5'b00000;
end
        else
        begin
                if(!full && write_enb)
                        wr_pt<=wr_pt + 1;
                else
                        wr_pt<=wr_pt;
                if(!empty && read_enb)
                        rd_pt<=rd_pt+1;
                else
                        rd_pt<=rd_pt;
        end
end
//empty and full logic
assign full =(wr_pt=={~rd_pt[4],rd_pt[3:0]})?1'b1:1'b0;
assign empty=(wr_pt==rd_pt)?1'b1:1'b0;
endmodule

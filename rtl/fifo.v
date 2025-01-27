module fifo(input clk,rst,we,re,input[7:0] data_in,output empty,full,output reg [7:0]data_out);
reg [3:0] wr_pt =4'b0;
reg [3:0] rd_pt=4'b0;
reg [4:0] fifo_counter;
reg [7:0] memory [15:0];
integer i;
 
 assign empty =(fifo_counter==5'b0)?1'b1:1'b0;
 assign full =(fifo_counter > 5'b01111);
 
 always @(posedge clk)
 begin
 if(rst)
 begin
 for(i=0;i<16;i=i+1)
 begin
 memory[i]<= 0;
 wr_pt<=4'b0;
 end
 end
  else if((we==1'b1) && (full==1'b0))
  begin
  memory[wr_pt]<=data_in;
  wr_pt<=wr_pt+1;
  end
  else
  wr_pt<=wr_pt;
  end
  always@(posedge clk)
  begin
  if(rst)
  begin
  rd_pt<=4'b0;
  data_out<=8'b0;
  end
  
  else if ((re==1'b1) && (empty==1'b0))
  begin
  data_out<=memory[rd_pt];
  rd_pt<= rd_pt+1;
  end
  else
  rd_pt<=rd_pt;
  
  end
  endmodule
  
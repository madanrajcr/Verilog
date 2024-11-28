/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   seq_det_tb.v   

Description :      Sequence detector Testbench

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module seq_det_tb();
		
  
   reg  data_in,clock,reset;
   wire dout;
	
   parameter CYCLE = 10;
		
   seq_det DUT(.seq_in(data_in),
	       .clock(clock),
	       .reset(reset),
	       .det_o(dout));

   always
      begin
	 #(CYCLE/2);
	 clock = 1'b0;
	 #(CYCLE/2);
	 clock=~clock;
      end 
	  
task din(input i);
      begin
         @(negedge clock);
         data_in=i;
      end
   endtask
					 
   
   task delay(input integer i);
      begin
	 #i;
      end
   endtask

   task rst_dut();
      begin
	 @(negedge clock);
	 reset=1'b1;
	 @(negedge clock);
	 reset=1'b0;
      end
   endtask
			
 initial 
      begin
         rst_dut;
din(1);
     din(0);
         din(1);
         din(0);
         din(1);
         din(0);
         din(1);
         din(1);
         rst_dut;
         din(0);
         din(1);
         #10;
        
      end
						 
 
   initial 
      $monitor("Reset=%b, , Din=%b, Output Dout=%b", reset,data_in,dout);
								
  
			
   		
endmodule     

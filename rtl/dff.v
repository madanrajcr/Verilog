/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   dff.v   

Description :      Delay Flipflop

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/
 
module dff2(
input D,
input CLK,
input RESET,
output reg Q,
output reg Qbar
);
always@(posedge CLK or posedge RESET)
if(RESET)
 begin
 Q <=0;
 Qbar <=1;
 end
else
 begin
 Q <=D;
 Qbar <=~D;
end
endmodule


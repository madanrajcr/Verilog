/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 
 
All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   dff_tb.v   

Description :      Testbench for Delay FF

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module dff2_tb;
reg D,CLK,RESET;
wire Q,Qbar;
dff2 DUT(
.D(D),
.CLK(CLK),
.RESET(RESET),
.Q(Q),
.Qbar(Qbar)
);
initial
begin
D=0;
CLK=0;
RESET=0;
#10;
CLK=1;
#10;
CLK=0;
#10;
CLK=1;
#10;
RESET=1;
#10;
RESET=0;
#10;
$finish;
end
endmodule

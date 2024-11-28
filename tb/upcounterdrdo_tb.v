module upcounterdrdo_tb();
reg clk,rst_n;
initial
begin
clk=1'b0;
rst_n=1'b1;
#100
rst_n=1'b0;
#100
rst_n=1'b1;
end
always@(*) begin
#10 clk=~clk;
end
localparam N=4;
wire [N-1:0] cntr;
upcounterdrdo dut(.clk(clk),.rst_n(rst_n),.cntr(cntr));
localparam M=10;
wire [M-1:0] cntr_m;
upcounterdrdo dat(.clk(clk),.rst_n(rst_n),.cntr(cntr_m));
endmodule



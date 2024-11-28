module syndualport_tb();
reg clk,reset,read,write;
reg [7:0]data_in;
reg [3:0]write_address,read_address;
wire [7:0]data_out;
integer i;

syndualport dut(clk,reset,read,write,data_in,write_address,read_address,data_out);
always
begin
# 5 clk =1'b0;
# 5 clk =~clk;
end
task reset_t;
begin
@(negedge clk);
reset=1'b1;
@(negedge clk);
reset=1'b0;
end
endtask

task write_t(input[7:0]a,input[3:0]b,input w,r);
begin
@(negedge clk)
write=w;
read=r;
write_address=b;
data_in=a;
end
endtask

task read_t(input[3:0]a,input w,r);
begin
@(negedge clk)
write=w;
read=r;
read_address=a;

end
endtask

initial
begin
reset_t;
repeat(10)
write_t({$random}%256,{$random}%16,1'b1,1'b0);
repeat(10)
read_t({$random}%16,1'b0,1'b1);
#100 $finish;
end

endmodule
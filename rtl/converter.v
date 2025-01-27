module converter(
input [31:0] in,
output [11:0] out);

reg [9:0] trillions,hunderds_millions,ten_millions,millions,hunderds_thousands,ten_thousands,thousands,hunderds,tens,ones;
reg [30:0] temp_reg;

always @(*)
begin
trillions = in / 1000000000;
temp_reg = in % 1000000000;
hunderds_millions = temp_reg / 100000000;
ten_millions = temp_reg % 10000000;
millions = temp_reg / 1000000;
hunderds_thousands = temp_reg % 100000;
ten_thousands = temp_reg / 10000;
thousands = temp_reg % 1000;
hunderds = temp_reg / 100;

tens = temp_reg % 10;
ones = temp_reg % 10;
end

assign converter={trillions,hunderds_millions,ten_millions,millions,hunderds_thousands,ten_thousands,thousands,hunderds,tens,ones};
endmodule
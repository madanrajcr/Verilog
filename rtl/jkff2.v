module jkff2(
input J,
input K,
input CLK,
output reg Q
);
parameter HOLD=2'b00;
parameter SET=2'b01;
parameter RESET=2'b10;
parameter TOGGLE=2'b11;
reg[1:0]state;
always@(posedge CLK)begin
case(state)
HOLD:begin
end
SET:begin
Q<=1;
end
RESET:begin
Q<=0;
end
TOGGLE:begin
Q<=~Q;
end
endcase
case({J,K})
2'b00:state<=HOLD;
2'b01:state<=SET;
2'b10:state<=RESET;
2'b11:state<=TOGGLE;
endcase
end
endmodule
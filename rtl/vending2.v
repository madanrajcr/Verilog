
module vending_machine (
  input clk,
  input reset,
  input [1:0] i,
  input [1:0] j,
  output reg x,
  output reg y
);

  reg [2:0] state;


  always @(posedge clk) begin
    if (reset) begin
      state <= 0;
    end else begin
      case (state)
        0: begin
          if (i & j) begin
            coin <= 2;
          end else if (i) begin
            coin <= 1;
          end
          state <= 1;
        end
        1: begin
          if (coin == 3) begin
            x <= 1;
          end else if (coin == 4) begin
            x <= 1;
            y <= 1;
          end
          state <= 2;
        end
        2: begin
          coin <= 0;
          state <= 0;
        end
      endcase
    end
  end

endmodule

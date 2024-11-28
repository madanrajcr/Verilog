module vendingmachine(
  input  clk,
  input  reset,
  input I,
  input J,
  output reg X,
  output reg Y
);

 
 parameter STATE_0=2'b00,STATE_1=2'b01,STATE_2=2'b10;
 


  reg [1:0] state;
  reg [1:0] nextState;

 

  always @(posedge clk or posedge reset)
 begin
    if (reset) 
begin
      state <= STATE_0;
    end
 else begin
      state <= nextState;
    end
 end

always @(state, I, J) begin
    case (state)


      STATE_0: begin
        	if (I == 1'b1 && J == 1'b0)
		 begin
        	  nextState = STATE_1;
       		 end 
		else if (I == 1'b1 && J == 1'b1)
		 begin
        	  nextState = STATE_2;
        	end 
		else 	
		begin
         	 nextState = STATE_0;
        	end
       		 X = 1'b0;
       		 Y = 1'b0;
     	 end


      STATE_1: begin
       		 if (I == 1'b0) 
			begin
          		nextState = STATE_1;
       			 end 
		else if (I == 1'b1 && J == 1'b0)
			 begin
          		nextState = STATE_2;
        		end 
		else if (I == 1'b1 && J == 1'b1) 
			begin
         		 nextState = STATE_0;
        		
       			 X = 1'b1;
       			 Y = 1'b0;
     			 end
		end
      STATE_2: 
		begin
        		if (I == 1'b0)
			 begin
          		nextState = STATE_2;
       			 end
			 else if (I == 1'b1 && J == 1'b0) 
			begin
         		 nextState = STATE_0;
			 X = 1'b1;
       			 Y = 1'b0;
      			  end
			 else if (I == 1'b1 && J == 1'b1) 
			begin
         		 nextState = STATE_0;
       			 
       			 X = 1'b1;
       			 Y = 1'b1;
     			 end
		end
    endcase
  end

endmodule

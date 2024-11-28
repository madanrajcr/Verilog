module vendingmachine_tb;
  
  reg clk;
  reg reset;
  reg I;
  reg J;
  wire X;
  wire Y;

  
  vendingmachine UUT(
    .clk(clk),
    .reset(reset),
    .I(I),
    .J(J),
    .X(X),
    .Y(Y)
  );

 
  always 
  begin
  #5  clk = 0;
    #5;  
    clk = 1;
  end

  initial 
  begin
    reset = 1;

    I = 0;
    J = 0;
    #10;
    reset = 0;

    
    I = 0;
    J = 0;
    #20;
   

 
    I = 1;
    J = 0;
    #20;
 

  
    I = 1;
    J = 1;
    #20;
   

   
    I = 1;
    J = 1;
    #20;
    

  
    I = 1;
    J = 0;
    #20;
  

    $display("All test cases passed!");
    $finish;
  end

endmodule

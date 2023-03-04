`include "q1.v"

module tb_N_bit_adder;
 parameter BIT_WIDTH = 64;
 // Inputs
 reg [BIT_WIDTH - 1:0] input1;
 reg [BIT_WIDTH - 1:0] input2;
 // Outputs
 wire [BIT_WIDTH - 1:0] answer;

 // Instantiate the Unit Under Test (UUT)
 n_adder #(.BIT_WIDTH(BIT_WIDTH)) uut(
  .var_a(input1), 
  .var_b(input2), 
  .sum(answer)
 );

 initial begin
  // Initialize Inputs
  input1 = 1209;
  input2 = 4565;
  #100;
  // Add stimulus here
  $display("A: 0x%h, B: 0x%h, SUM: 0x%h", input1, input2, answer);
 end
      
endmodule

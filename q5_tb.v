`include "q5.v"

module q5_tb;

	parameter BIT_WIDTH = 32;

	reg [BIT_WIDTH - 1 : 0] var_a;
	reg [BIT_WIDTH - 1 : 0] var_b;
	wire [BIT_WIDTH - 1 : 0] result;
	reg [1:0] select;

	alu mod_alu(select, var_a, var_b, result);

	initial begin
		var_a = 25;
		var_b = 423;
		select = 2'b00;

		#100;

		$display("Add operation %h + %h = %h [Required: %h]", var_a, var_b, result, var_a + var_b);

		var_a = 834;
		var_b = 1943;
		select = 2'b01;

		#100;

		$display("Increment operation %h + 1 = %h [Required: %h]", var_a, result, var_a + 1);

		var_a = 51;
		var_b = 73;
		select = 2'b10;

		#100;

		$display("Max operation max(%h, %h) = %h [Required: %h]", var_a, var_b, result, var_b);

	end

endmodule

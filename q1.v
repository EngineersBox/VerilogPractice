module adder(input a, b, cin,
			 output sum, cout);
	assign sum = (a ^ b) ^ cin;
	assign cout = (b & cin) | (a & b) | (a & cin);
endmodule

module n_adder #(parameter BIT_WIDTH = 32)(var_a, var_b, sum);

	input [BIT_WIDTH - 1 : 0] var_a;
	input [BIT_WIDTH - 1 : 0] var_b;
	output [BIT_WIDTH - 1 : 0] sum;

	wire [BIT_WIDTH - 1:0] carry;

	genvar i;

	generate
		for (i = 0; i < BIT_WIDTH; i = i + 1) begin: gen_n_bit_adder
			adder fa(
				var_a[i],
				var_b[i],
				i > 0 ? carry[i - 1] : 1'b0,
				sum[i],
				carry[i]
			);
		end
	endgenerate
endmodule

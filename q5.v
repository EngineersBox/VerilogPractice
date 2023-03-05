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

module max #(parameter BIT_WIDTH = 32)(var_a, var_b, higher);
	input [BIT_WIDTH - 1 : 0] var_a;
	input [BIT_WIDTH - 1 : 0] var_b;
	output [BIT_WIDTH - 1: 0] higher;

	assign higher = var_a > var_b ? var_a : var_b;

endmodule

module alu #(parameter BIT_WIDTH = 32)(select, a, b, y);
	input [1:0] select; // 0 = add, 1 = increment, 2 = max
	input [BIT_WIDTH - 1 : 0] a;
	input [BIT_WIDTH - 1 : 0] b;
	output reg [BIT_WIDTH - 1 : 0] y;

	reg [BIT_WIDTH - 1 : 0] var_b_conn;
	wire [BIT_WIDTH - 1 : 0] adder_output_conn;
	wire [BIT_WIDTH - 1 : 0] max_output_conn;
	
	n_adder #(.BIT_WIDTH(BIT_WIDTH)) mod_adder(.var_a(a), .var_b(var_b_conn), .sum(adder_output_conn));
	max #(.BIT_WIDTH(BIT_WIDTH)) mod_max(.var_a(a), .var_b(b), .higher(max_output_conn));

	always @(select or a or b) begin
		if (select == 2'b00) begin
			var_b_conn <= b;
			y <= adder_output_conn;
		end else if (select == 2'b01) begin
			var_b_conn <= 1;
			y <= adder_output_conn;
		end else if (select == 2'b10) begin
			y <= max_output_conn;
		end
	end

endmodule

`include "q3.v"

module testbench_q3;
	parameter CASES = 5;
	
	reg [CASES - 1:0] s;
	reg [CASES - 1:0] r;
	reg [CASES - 1:0] d;
	wire [CASES - 1:0] y;
	reg [CASES - 1:0] actual;
	q3 q3_0(.s(s[0]), .r(r[0]), .d(d[0]), .y(y[0]));
	q3 q3_1(.s(s[1]), .r(r[1]), .d(d[1]), .y(y[1]));
	q3 q3_2(.s(s[2]), .r(r[2]), .d(d[2]), .y(y[2]));
	q3 q3_3(.s(s[3]), .r(r[3]), .d(d[3]), .y(y[3]));
	q3 q3_4(.s(s[4]), .r(r[4]), .d(d[4]), .y(y[4]));
	integer i;

	initial begin
		s[0] = 1;
		s[1] = 0;
		s[2] = 1;
		s[3] = 0;
		s[4] = 0;

		r[0] = 1;
		r[1] = 1;
		r[2] = 0;
		r[3] = 0;
		r[4] = 0;

		d[0] = 1;
		d[1] = 0;
		d[2] = 1;
		d[3] = 0;
		d[4] = 1;

		actual[0] = 1;
		actual[1] = 0;
		actual[2] = 1;
		actual[3] = 0;
		actual[4] = 1;

		#100

		for (i = 0; i < CASES; i = i + 1) begin
			if (y[i] == actual[i])
				$display("Succeeded [S: %h] [R: %h] [D: %h] [Y: %h] == [Actual: %h]", s[i], r[i], d[i], y[i], actual[i]);
			else
				$display("Failed [S: %h] [R: %h] [D: %h] [Y: %h] != [Actual: %h]", s[i], r[i], d[i], y[i], actual[i]);
		end
	end
endmodule

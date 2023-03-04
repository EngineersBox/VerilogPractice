`include "q4.v"

module q4_tb;

	reg clk;
	reg data;
	reg reset_n;
	wire q;
	reg [2:0] delay;

	dfaSsR dff(.data(data), .clk(clk), .q(q), .reset_n(reset_n));

	always #10 clk = ~clk;

	initial begin
		clk <= 0;
		data <= 0;
		reset_n <= 0;

		#15 data <= 1;
		#10 reset_n <= 1;
		for (integer i = 0; i < 5; i = i + 1) begin
			delay = $random;
			#(delay) data <= i;
		end
	end

endmodule

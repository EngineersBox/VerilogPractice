module dfaSsR(data, clk, q, reset_n);
	input data, clk, reset_n;
	output reg q;

	always @(posedge clk or negedge reset_n) begin
		if (!reset_n)
			q <= 0;
		else
			q <= data;
	end

endmodule

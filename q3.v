module q3(input s, r, d,
	      output y);
	assign y = s || (~r && d);
endmodule

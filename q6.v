module ram_sp #(parameter DATA_WIDTH = 32,
				parameter DEPTH = 16)
			   (input clk,
				input wire [($clog2(DEPTH)) - 1 : 0] addr,
				inout wire [DATA_WIDTH - 1 : 0] data,
				input chip_select,
				input write_enable,
				input output_enable);
	reg [DATA_WIDTH - 1 : 0] mem [DEPTH - 1 : 0];
	reg [DATA_WIDTH - 1 : 0] temp;

	always @(posedge clk) begin: write_to_mem
		if (write_enable && chip_select)
			mem[addr] <= data;
	end

	always @(posedge clk) begin: read_to_temp
		if (!write_enable && chip_select)
			temp <= mem[addr];
	end

	assign data = chip_select && !write_enable && output_enable ? temp : 'hz;
endmodule

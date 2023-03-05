`include "q6.v"

module q6_tb;

	parameter DEPTH = 16;
	parameter DATA_WIDTH = 32;
	parameter ADDR_WIDTH = $clog2(DEPTH);

	reg clk;
	reg chip_select;
	reg write_enable;
	reg output_enable;
	reg [ADDR_WIDTH - 1 : 0] addr;
	wire [DATA_WIDTH - 1 : 0] data;
	reg [DATA_WIDTH - 1 : 0] tb_data;

	ram_sp #(.DEPTH(DEPTH), .DATA_WIDTH(DATA_WIDTH)) ram(
		.clk(clk),
		.addr(addr),
		.data(data),
		.chip_select(chip_select),
		.write_enable(write_enable),
		.output_enable(output_enable)
	);

	always #10 clk = ~clk;
	assign data = !output_enable ? tb_data : 'hz;

	initial begin
		{clk, chip_select, write_enable, addr, tb_data, output_enable} <= 0;

		repeat (2) @(posedge clk);

		for (integer i = 0; i < 2 ** ADDR_WIDTH; i = i + 1) begin
			repeat (1) @(posedge clk) begin
				addr <= i;
				write_enable <= 1;
				chip_select <= 1;
				output_enable <= 0;
				tb_data <= $random;
			end
		end

		#20;

		for (integer i = 0; i < 5; i = i + 1) begin
			$display("Write [ADDR: 0x%h] [DATA: 0x%h]", i, tb_data[i]);	
		end

		for (integer i = 0; i < 2 ** ADDR_WIDTH; i = i + 1) begin
			repeat (1) @(posedge clk) begin
				addr <= i;
				write_enable <= 0;
				chip_select <= 1;
				output_enable <= 1;
			end
		end

		#20;

		for (integer i = 0; i < 5; i = i + 1) begin
			$display("Read [ADDR: 0x%h] [DATA: 0x%h]", i, tb_data[i]);	
		end

		#20 $finish;
	end

endmodule

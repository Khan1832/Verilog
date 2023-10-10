include "syncfifo.v";
module tb;
//parameters
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR_WIDTH=$clog2(DEPTH);
//ports
reg clk_i,rst_i;
reg wr_en,rd_en;
reg [WIDTH-1:0] wr_data_i;
wire [WIDTH-1:0] rd_data_o;
wire full_o,empty_o,error_o;
integer i;
//moduleinstantiation 
syncfifo dut (.*);
//clkgen
initial begin
	clk_i=0;
	forever #5 clk_i=~clk_i;
end
//stimulus
initial begin
	rst_i=1;
	wr_data_i=0;
	wr_en=0;
	rd_en=0;
	#20;
	rst_i=0;
	for(i=0;i<DEPTH;i=i+1)begin
		@(posedge clk_i)
		wr_data_i=$random;
		wr_en=1;
	end
		@(posedge clk_i)
		wr_data_i=0;
		wr_en=0;
	for(i=0;i<DEPTH;i=i+1)begin
		@(posedge clk_i)
		rd_en=1;
	end
		@(posedge clk_i)
		rd_en=0;
end
initial begin
	#1000;
	$finish;
end
endmodule




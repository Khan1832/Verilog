`include "tff.v";
`include "bit3countdown.v";
module tb;
reg clk_i,rst_i;
wire [2:0] count_o;

bit3countdown dut(.clk_i(clk_i),.rst_i(rst_i),.count_o(count_o));
initial begin
	clk_i=0;
	forever #5 clk_i=~clk_i;
end
initial begin 
	rst_i=0;
	repeat(2)@(posedge clk_i);
	rst_i=1;
end
initial begin 
	#500;
	$finish;
end 
endmodule

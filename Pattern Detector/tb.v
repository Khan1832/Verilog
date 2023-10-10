`include"patdetmealy.v"
module tb;
parameter B=1'b1;
parameter C=1'b0;
parameter S_RESET=5'b00001;
parameter S_B=5'b00010;
parameter S_BB=5'b00100;
parameter S_BBC=5'b01000;
parameter S_BBCB=5'b10000;
integer seed;
integer count;
reg clk_i,rst_i,din,valid_i;
wire pat_det_o;
patdetmealy dut(
	.clk_i(clk_i),
	.rst_i(rst_i),
	.din(din),
	.valid_i(valid_i),
	.pat_det_o(pat_det_o));

initial begin
	clk_i=0;
	forever #5 clk_i=~clk_i;
end	

initial begin 
	rst_i=1;
	din=0;
	valid_i=0;
	count=0;
	$value$plusargs("seed=%0d",seed);
	repeat(2)@(posedge clk_i);
	rst_i=0;
	repeat(500)begin
		@(posedge clk_i)
	valid_i=1;
	din=$random(seed);
	end 
	@(posedge clk_i)
	valid_i=0;
	#100;
	$display("#####################################");
	$display("for given seed =%0d, pattern is detected %0d times",seed,count);
	$display("#####################################");
	$finish;
	end
always @(posedge clk_i) begin
    if (pat_det_o) begin
      count = count + 1;
    end
  end	


endmodule


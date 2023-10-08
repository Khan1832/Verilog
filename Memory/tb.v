
`include "memdes.v"
module tb;
parameter WIDTH=4;
parameter DEPTH=16;
parameter ADDRWIDTH=$clog2(DEPTH);
parameter N=20;
integer i;
integer FH;
//port declaration
reg [8*N:1] testcase;
reg flag; 
reg clk_i,rst_i;
reg [ADDRWIDTH-1:0] addr_i;
reg [ADDRWIDTH-1:0] wdata_i;
reg valid_i;
reg wr_en,rd_en;
wire[ADDRWIDTH-1:0] rdata_o;
wire ready_o;


memdes dut(.clk_i(clk_i),.rst_i(rst_i),.addr_i(addr_i),.wdata_i(wdata_i),.valid_i(valid_i),
	.wr_en(wr_en),.rd_en(rd_en),.rdata_o(rdata_o),.ready_o(ready_o));

initial begin
clk_i=0;
forever #5 clk_i=~clk_i;
end
function reg reset_logic(input value);
	begin	
	addr_i=value;
	wdata_i=value;
	rd_en=value;
	wr_en=value;
	valid_i=value;
	reset_logic=1;
	end
endfunction 

task write_mem (input reg [ADDRWIDTH:0] start_addr,input reg [ADDRWIDTH:0] no_of_location);
	begin 
	for(i=start_addr;i<start_addr+no_of_location;i=i+1)begin
		@(posedge clk_i);
		wdata_i=$random;
		addr_i=i;
		wr_en=1;
		rd_en=0;
		valid_i<=1;

		$fdisplay(FH,"TIME =%0t , addr_i=%0h, wdata_i=%0h",$time,addr_i,wdata_i);
		wait(ready_o==1);
	end
	@(posedge clk_i);
	flag=reset_logic(0);

end
endtask

task read_mem (input reg [ADDRWIDTH:0] start_addr,input reg [ADDRWIDTH:0] no_of_location);
	begin 
	for(i=start_addr;i<start_addr+no_of_location;i=i+1)
	begin
		@(posedge clk_i);
		addr_i=i;
		wr_en=0;
		rd_en=1;
		valid_i=1;
		repeat(2)@(posedge clk_i);
		wait(ready_o==1);
		$fdisplay(FH,"TIME =%0t , addr_i=%0h, rdata_o=%0h",$time,addr_i,rdata_o);
	end
	@(posedge clk_i);
	flag=reset_logic(0);

end
endtask


initial begin 
	rst_i=1;
	flag=reset_logic(0);
	FH=$fopen("data.log");
	$value$plusargs("testcase=%s",testcase);

	#10;
	repeat(2)@(posedge clk_i);
	rst_i=0;
	case(testcase)
		"test_fulmem_wr_rd":begin
			write_mem(0,DEPTH);
			read_mem(0,DEPTH);
		end
		"test_half_mem_wr_rd":begin
			write_mem(0,DEPTH/2);
			read_mem(0,DEPTH/2);
	// 2nd half of memory
			write_mem(DEPTH/2,DEPTH/2);
			read_mem(DEPTH/2,DEPTH/2);
		end

	"test_quarter_mem_wr_rd":begin
			write_mem(0,DEPTH/4);
			read_mem(0,DEPTH/4);
	// 2nd quarter of memory
			write_mem(DEPTH/4,DEPTH/4);
			read_mem(DEPTH/4,DEPTH/4);
	// 3rd quarter of memory
			write_mem(DEPTH/2,DEPTH/4);
			read_mem(DEPTH/2,DEPTH/4);
	// last quarter of memory
			write_mem(3*DEPTH/4,DEPTH/4);
			read_mem(3*DEPTH/4,DEPTH/4);
		end
	endcase

	#100;
	$fclose(FH);
$finish;
end
endmodule

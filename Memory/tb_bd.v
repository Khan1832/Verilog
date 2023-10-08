`include "memdes.v"
module tb;
parameter WIDTH=16;
parameter DEPTH=16;
parameter ADDRWIDTH=$clog2(DEPTH);
parameter N=20;
integer i;
//port declaration
reg [8*N:1] testcase;
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

task reset_logic();
	begin	
	addr_i=0;
	wdata_i=0;
	rd_en=0;
	wr_en=0;
	valid_i=0;
	end
endtask 

task write_mem (input reg [ADDRWIDTH:0] start_addr,input reg [ADDRWIDTH:0] no_of_location);
	begin 
	for(i=start_addr;i<start_addr+no_of_location;i=i+1)begin
		@(posedge clk_i);
		wdata_i=$random;
		addr_i=i;
		wr_en=1;
		rd_en=0;
		valid_i<=1;
		wait(ready_o==1);
	end
	@(posedge clk_i);
	reset_logic();

end
endtask

task bd_write (input reg [ADDRWIDTH:0] start_addr,input reg [ADDRWIDTH:0] no_of_location);
	begin
	       $readmemh("image.hex",dut.mem,start_addr,start_addr+no_of_location-1);	
end
endtask

task bd_read (input reg [ADDRWIDTH:0] start_addr,input reg [ADDRWIDTH:0] no_of_location);
	begin
	       $writememb("image_2.bin",dut.mem,start_addr,start_addr+no_of_location-1);	
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
		end
	@(posedge clk_i);
	reset_logic();
	end
endtask


initial begin 
	$value$plusargs("testcase=%s",testcase);
	$display("testcase=%0s",testcase);
	rst_i=1;
	reset_logic();
 	#20;
	repeat(2)@(posedge clk_i);
	rst_i=0;
	case(testcase)
		"test_fd_wr_rd":begin
			write_mem(0,DEPTH);
			read_mem(0,DEPTH);
		end
		"test_bd_wr_rd":begin
			bd_write(0,DEPTH);
			bd_read(0,DEPTH);
		end

	"fd_wr_bd_rd":begin
			write_mem(0,DEPTH);
			bd_read(0,DEPTH);
		end

	"bd_wr_fd_rd":begin
			bd_write(0,DEPTH);
			read_mem(0,DEPTH);
		end
		endcase
end
initial begin
#500;
$finish;
end
endmodule

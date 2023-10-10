module syncfifo(clk_i,rst_i,wr_data_i,rd_data_o,wr_en,rd_en,empty_o,full_o,error_o);
parameter WIDTH=8;
parameter DEPTH=16;
parameter ADDR_WIDTH=$clog2(DEPTH);
input clk_i,rst_i;
input wr_en,rd_en;
input [WIDTH-1:0] wr_data_i;
output reg [WIDTH-1:0] rd_data_o;
output reg full_o,empty_o,error_o;
reg  [ADDR_WIDTH-1:0] wr_ptr;
reg  [ADDR_WIDTH-1:0] rd_ptr;
reg  wr_toggle,rd_toggle;
reg [WIDTH-1:0] mem [DEPTH-1:0];
integer i;

always@(posedge clk_i)begin
	if (rst_i==1)begin
		full_o=0;
		empty_o=1;
		error_o=0;
		rd_data_o=0;
		wr_ptr=0;
		rd_ptr=0;
		wr_toggle=0;
		rd_toggle=0;
		for(i=0;i<DEPTH;i=i+1)begin
			mem[i]=0;
		end
	end
	else begin 
		if(wr_en==1)begin
			if (full_o==0)begin
				error_o=0;
				mem[wr_ptr]=wr_data_i;
				if(wr_ptr==DEPTH-1)begin
					wr_toggle=~wr_toggle;
				end
				else begin
					wr_ptr=wr_ptr+1;
				end
			end
			else begin 
				error_o=1;
			end	
		end
		if(rd_en==1)begin
			if (empty_o==0)begin
				error_o=0;
				rd_data_o=mem[rd_ptr];
				if(rd_ptr==DEPTH-1)begin
					rd_toggle=~rd_toggle;
				end
				else begin
					rd_ptr=rd_ptr+1;
				end
			end
			else begin 
			error_o=1;
			end	
		end
	end
end
always@(*)begin
empty_o=0;
full_o=0;
if(wr_ptr==rd_ptr && wr_toggle!=rd_toggle)begin
	full_o=1;
end
if(wr_ptr==rd_ptr && wr_toggle==rd_toggle)begin
	empty_o=1;
end
end
endmodule



	






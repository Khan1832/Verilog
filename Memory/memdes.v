module memdes(clk_i,rst_i,addr_i,wdata_i,valid_i,wr_en,rd_en,rdata_o,ready_o);

parameter WIDTH=16;
parameter DEPTH=16;
parameter ADDRWIDTH=$clog2(DEPTH);
integer i;
//port declaration

input clk_i,rst_i;
input [ADDRWIDTH-1:0] addr_i;
input [ADDRWIDTH-1:0] wdata_i;
input valid_i;
input wr_en,rd_en;
output reg [ADDRWIDTH-1:0] rdata_o;
output reg ready_o;
//register 
reg [WIDTH-1:0] mem [DEPTH-1:0];

always @(posedge clk_i or posedge ready_o) begin
    if (rst_i == 1) begin
      rdata_o <= 0;
      ready_o <= 0;
      for (i = 0; i < DEPTH; i = i + 1) begin
        mem[i] <= 0;
      end
    end
    else begin
      if (valid_i == 1) begin
        ready_o <= 1;
        if (wr_en == 1) begin
          mem[addr_i] <= wdata_i;
        end
        if (rd_en == 1) begin
          rdata_o <= mem[addr_i];
        end
      end
      else begin
        ready_o <= 0;
      end
    end
  end

endmodule




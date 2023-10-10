module bit3count(clk_i,rst_i,count_o);
input clk_i,rst_i;
output [2:0] count_o;
wire w1;
tff t1(.t(1),.clk_i(clk_i),.rst_i(rst_i),.q_o(count_o[0]));
tff t2(.t(count_o[0]),.clk_i(clk_i),.rst_i(rst_i),.q_o(count_o[1]));
tff t3(.t(w1),.clk_i(clk_i),.rst_i(rst_i),.q_o(count_o[2]));

and (w1,count_o[0],count_o[1]);

endmodule

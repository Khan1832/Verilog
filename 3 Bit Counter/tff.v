module tff(t,clk_i,rst_i,q_o);
input clk_i,t,rst_i;
output reg q_o;
always@(posedge clk_i)begin
	if (rst_i==0)begin
		q_o<=0;
	end 
	else 
	if(t)
		q_o<=~q_o;
	else
		q_o<=q_o;
end 
endmodule


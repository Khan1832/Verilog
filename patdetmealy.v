module patdetmealy(clk_i,rst_i,din,valid_i,pat_det_o);
parameter B=1'b1;
parameter C=1'b0;
parameter S_RESET=5'b00001;
parameter S_B=5'b00010;
parameter S_BB=5'b00100;
parameter S_BBC=5'b01000;
parameter S_BBCB=5'b10000;
input clk_i,rst_i;
input din;
input valid_i;
output reg pat_det_o;
reg [4:0] state;
reg [4:0] next_state;
always@(posedge clk_i) begin
	if (rst_i==1)begin
		pat_det_o=0;
		state=S_RESET;
		next_state=S_RESET;	
	end
	else begin
		if (valid_i==1)begin
			pat_det_o=0;
		case (state)
			S_RESET: 
			begin 
			if (din==B)
			begin
				next_state=S_B;
			end
			else begin
				next_state=S_RESET;
			end
				end
			S_B: 
			begin 
			if (din==B)
			begin
				next_state=S_BB;
			end
			else begin
				next_state=S_RESET;
			end
				end

			S_BB: 
			begin 
			if (din==B)
			begin
				next_state=S_BB;
			end
			else begin
				next_state=S_BBC;
			end
				end

			S_BBC: 
			begin 
			if (din==B)
			begin
				next_state=S_BBCB;
			end
			else begin
				next_state=S_RESET;
			end
				end

			S_BBCB: 
		begin 
			if (din==B)
			begin
				next_state=S_BB;
				pat_det_o=1;
			end
			else begin
				next_state=S_RESET;
			end
				end
			default: next_state=S_RESET;

		endcase
		end
		else begin
			pat_det_o=0;
		end	
	end
end	
always@(posedge clk_i)	
begin
	state=next_state;
end 
endmodule

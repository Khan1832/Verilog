module updown_counter(clk_i, rst_i, mode_i, count_o);
  input clk_i, rst_i, mode_i;
  output reg [2:0] count_o;
  reg direction;

  always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
      count_o <= 0; // Reset the counter to 0 when the reset signal is asserted.
      direction <= 1; // Initialize the direction to count up.
    end else begin
      if (mode_i)
        direction <= ~direction; // Toggle the direction when the mode bit is high (1).
      
      if (direction)
        count_o <= count_o + 1; // Count up when the direction is 1.
      else
        count_o <= count_o - 1; // Count down when the direction is 0.
    end
  end
endmodule

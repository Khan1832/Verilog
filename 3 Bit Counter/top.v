module tb_updown_counter;
  reg clk_i, rst_i, mode_i;
  wire [2:0] count_o;

  // Instantiate the updown_counter module
  updown_counter dut(.clk_i(clk_i), .rst_i(rst_i), .mode_i(mode_i), .count_o(count_o));

  // Clock generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end

  // Test scenario
  initial begin
    rst_i = 1;
    mode_i = 0; // Set mode to count up
    #10; // Wait for 10 time units
    rst_i = 0; // Release reset
    #100; // Wait for 100 time units before changing mode
    mode_i = 1; // Change mode to count down
    #200; // Wait for 200 time units before ending the simulation
    $finish;
  end

  // Display count value on every clock edge
  always @(posedge clk_i) begin
    $display("count_o = %d", count_o);
  end
endmodule

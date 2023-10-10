# 3 Bit Counter

This repository contains Verilog designs for up, down, and up/down counters, along with their respective testbenches. Additionally, it includes a Verilog design for a T flip-flop.

## Design Files

### 1. Up Counter (`bit3count.v`)

A simple 3-bit up counter implemented in Verilog.

### 2. Down Counter (`bit3countdown.v`)

A simple 3-bit down counter implemented in Verilog.

### 3. Up/Down Counter with Mode Bit (`updowncounter.v`)

A 3-bit up/down counter with a mode bit that toggles the counting direction.

### 4. T Flip-Flop (`tff.v`)

A Verilog design for a T flip-flop.

## Testbenches

### 1. Up/Down Counter Testbench (`tb.v`)

Testbench for the up/down counter, including clock, mode switching, and counting verification.

### 2. Up/Down Counter Testbench with Separate Up and Down Tests (`top.v`)

Testbench for the up/down counter with separate test cases for counting up and counting down.


## Block Diagram

A block diagram illustrating the structure of the up and down counter design is provided in a JPEG image file.


## How to Use

1. Clone the repository: `git clone https://github.com/your-username/updown-counter.git`
2. Navigate to the repository: `cd updown-counter`
3. Open the design files and testbenches using a suitable Verilog development environment (e.g., Xilinx Vivado, Quartus Prime).
4. Simulate the designs using the respective testbench files to verify functionality.


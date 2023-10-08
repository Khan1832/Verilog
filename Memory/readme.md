# Memory Design Module

This repository contains a Verilog module for a memory design with read and write functionalities. It includes a memory module (`memdes`) and a testbench (`tb`) to verify its functionality.

# Table of Contents
- [About the Project]
- [Usage]
- [Testing]
  
# About the Project

The Verilog module `memdes` implements a memory design with a specified width, depth, and address width. It provides functionalities to read and write data into memory locations. The testbench (`tb`) demonstrates various test scenarios to validate the functionality of the memory design.

# Usage
1.Clone the repository:
  
  git clone https://github.com/<username>/<repository>.git
  cd <repository>

2. Open the project in your preferred Verilog development environment.

3. Simulate the design using the provided testbench (`tb` or `tb_bd`) to test different memory read and write scenarios.

# Testing

The testbench (`tb`) demonstrates three test scenarios:
1. **Full Memory Write and Read**
   - Writes data to the entire memory and reads it back.

2. **Half Memory Write and Read**
   - Writes data to the first half of the memory and reads it back.
   - Writes data to the second half of the memory and reads it back.

3. **Quarter Memory Write and Read**
   - Writes data to four quarters of the memory and reads it back.

The testbench (`tb_bd`) demonstrates the test scenarios:

1. **Full Memory Write and Read (test_fd_wr_rd):**
        -Writes random data to the entire memory and reads it back.

2. **Binary Data Write and Read (test_bd_wr_rd):**
        -Loads memory contents from a file (image.hex), writes it to memory, and then saves the memory contents to another file (image_2.bin).

3. **Mixed Data Write and Binary Data Read (fd_wr_bd_rd):**
        -Writes random data to the entire memory and then reads memory contents from a file (image.hex).

4. **Binary Data Write and Mixed Data Read (bd_wr_fd_rd):**
        -Loads memory contents from a file (image.hex), writes it to memory, and then reads the memory using the memdes module.


#Simulation Run Script (run.do)

The run.do script is used to automate the simulation process for the tb_bd testbench. 
It compiles the Verilog files, initiates the simulation, sets up waveform visualization, runs the simulation, and saves simulation waveforms.

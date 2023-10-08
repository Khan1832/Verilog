# Memory Design Module

This repository contains a Verilog module for a memory design with read and write functionalities. 

It includes a memory module (`memdes`) and a testbench (`tb`) to verify its functionality.

# Table of Contents
- About the Project
- Usage
- Testing
- Simulation
  
# About the Project

This project is a Verilog-based simulation and testing environment for a memory design (memdes). 

The testbench (tb) includes functionalities to write and read data from the memory at specified addresses, employing different test cases. 

The memory is parameterized by width, depth, and address width. 

The project encompasses modules for writing and reading operations, employing a simulated clock and reset logic.

The simulation generates a log file ("data.log") with timing information, addresses, and data during memory transactions. 

Test cases cover full memory access, accessing half of the memory, and accessing quarters of the memory, aiming to validate the memory module's functionality and performance. 

ModelSim is used for simulation, and a provided script automates compilation, simulation, and waveform generation for ease of testing.

# Usage
1. Clone the repository:
     git clone https://github.com/<username>/<repository>.git
     cd <repository>

3. Open the project in your preferred Verilog development environment.

4. Simulate the design using the provided testbench (`tb` or `tb_bd`) to test different memory read and write scenarios.

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

3. **Binary Data Write and Read (test_bd_wr_rd):**
   
   -Loads memory contents from a file (image.hex), writes it to memory, and then saves the memory contents to another file (image_2.bin).

4. **Mixed Data Write and Binary Data Read (fd_wr_bd_rd):**
   
   -Writes random data to the entire memory and then reads memory contents from a file (image.hex).

6. **Binary Data Write and Mixed Data Read (bd_wr_fd_rd):**
   
    -Loads memory contents from a file (image.hex), writes it to memory, and then reads the memory using the memdes module.


# Simulation Run Script (run.do)

-The run.do script is used to automate the simulation process for the tb_bd testbench.

-It compiles the Verilog files, initiates the simulation, sets up waveform visualization, runs the simulation, and saves simulation waveforms.


# Pattern Detector Project using Moore Finite State Machine

This repository contains the Verilog design files, test bench, and state diagram for a pattern detection project utilizing a Moore finite state machine (FSM). 

The project aims to detect the specific pattern "CCBBCB" in a sequence of input signals.

## Contents

- **Design File**

- **Test Bench**

- **State Diagram**

## Design Files

- **`patdetmealy.v`**: Verilog file containing the design implementation of the pattern detector using a Moore FSM. The pattern "CCBBCB" is detected based on the input sequence.

## Test Bench

- **`tb.v`**: Verilog file containing the test bench to verify the functionality of the pattern detector implemented with the Moore FSM.

- It provides stimulus signals to the design and validates the pattern detection logic.

## State Diagram

- **`state_diagram.png`**: A diagram illustrating the states and transitions in the Moore FSM used for pattern detection.

-   The states correspond to different parts of the pattern "CCBBCB," and transitions are based on the input sequence.

## Usage

To simulate and test the pattern detector, follow these steps:

1. Clone the repository to your local machine:
   ```
   git clone <repository_url>
   cd pattern_detector_project
   ```

2. Simulate the design using a suitable simulation tool (e.g., ModelSim, VCS, etc.):
   ```
   <simulation_command> tb.v patdetmealy.v
   ```

   Replace `<simulation_command>` with the appropriate simulation command for your tool.

3. Analyze the simulation results to verify the pattern detection and its associated output.


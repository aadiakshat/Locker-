6-Bit Sequence Lock FSM in Verilog

This project implements a simple 6-bit sequence lock using a finite state machine (FSM) written in Verilog. The module checks if a specific sequence (`111011`) is entered bit by bit on every clock cycle. If the correct sequence is detected, the output `l` becomes 1 for one clock cycle. The detection is non-overlapping, meaning it resets to the initial state if the sequence is broken or after one successful detection.

Overview

- Total states: 7 (S0 to S6)
- Input: 
  - `a`: 1-bit input
  - `clk`: clock
  - `reset`: active low reset
- Output:
  - `l`: lock signal (goes high when the sequence is equal to the password)

Features

- Non-overlapping pattern detection
- One-cycle high output (`l = 1`) on match
- FSM resets to initial state after complete or failed sequence
- Works with multiple back-to-back sequences

How to Run

1. Open the files in any Verilog-supported text editor like VS Code(Recommended).
2. Make sure the Verilog/SystemVerilog extension is installed.
3. You can use simulators like EDA Playground or GTKWave.
4. To test, copy the module and testbench code and simulate.
5. Output `l` will be shown in the waveform or console when the sequence is detected.

Files

- `fivedigitSeqLock.v` – Main FSM Verilog module
- `lock_tb.v` – Testbench with sample inputs
- `waveform.png` – Screenshot of the waveform

Sample Input

To unlock:
Put a = 1, 1, 1, 0, 1, 1 with delays of 10ns respectively after every value of a
After this sequence, `l = 1` for one clock cycle, then resets.

Changes

You can change the sequence in the module by modifying the `password` wire;
You can also change the values of a to check if the module detects wether the sequence is incorrect(output l will remain low in that case)

Feel free to modify, test with your own inputs, or integrate into larger Verilog projects.

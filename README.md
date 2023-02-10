# RTL Components-Iterative-Logic-Synthesis
Design of a circuit that calculates the number of 1’s on its data inputs

The circuit has 127 inputs, and it is built of cascadable modules in a regular structure.

1) First, I write the code for a parameterized full-adder in SystemVerilog.

2) Next, the code for a parametrized n-bit adder that uses n to adjust the size and delay value of the adder, and testing the module with a testbench.

3) Next, using SystemVerilog **generate statement** I wire n-bit adders (where n is 1 to 6) in a tree structure to build a 127-bit one’s counter, and test the design for functionality and timing.

4) Using SystemVerilog **always** and procedural **for statements** I wrote a synthesizable description of the One’s Counter of the previous part. 






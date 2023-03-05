# VerilogPractice
Practice problems and solutions for verilog

## Questions

1. Implement an adder supporting N-bit numbers (parameterised)
2. Create a module representing the following FSM (TODO: FSM diagram)
3. Provide a Verilog module implemented using procedural code with `if-else` for the following table where `S`, `R`, `D` are inputs and `Y` is an output. `X` denotes any value.

| **S** | **R** | **D** | **Y** |
|-------|:-----:|:-----:|-------|
| 1     | 1     | X     | X     |
| 0     | 1     | X     | 0     |
| 1     | 0     | X     | 1     |
| 0     | 0     | 0     | 0     |
| 0     | 0     | 1     | 1     |
| 0     | 0     | 1     | 1     |
4. Implement a flip-flop with an active-low async reset
5. Implement an ALU with 3 operations on select:
	1. `Y=A+B`
	2. `Y=A+1`
	3. `Y=max(A, B)`
6. Design and implement a single-port RTL RAM module with parameterised address with, data width and depth.

## References

### Problems

<https://eclipse.umbc.edu/robucci/cmpe415/verilog_practice/index.html>

<http://www.pldworld.com/_hdl/4/_ref/-bawankule-/verilogcenter/quest.html>

### Verilog Explainations

<https://www.chipverify.com/verilog/verilog-parameters>

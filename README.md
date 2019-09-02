# cMIPS
**A complete classic 5-stage pipelined MIPS 32-bit processor, including a 2-bit branch predictor, a branch prediction buffer and a direct-mapped cache.**

![alt text](https://i.stack.imgur.com/TkmAJ.png)

* 5-stage pipelined MIPS 32-bit processor
* 2-bit branch predictor
* 1024 depth branch prediction buffer
* 2KB direct-mapped cache 
* 64K main memory

cMIPS is fully evaluated on Xilinx Vivado design tools and several testbenchs are providered to test the processor. It is also evaluated on Xilinx ZC706 board. 
The clock can run at 285MHz(3.5ns) and the hardware resource utilization: 
* FF: 1709
* LUT: 3171
* MEMORY LUT: 1015
*BRAM: 7.5

This MIPS processor is coded according to the fifth edition book of David A.Patternson & John L.Hennsessy, "Computer Organization and Design".
The architecture is the referred to the descriptions in this book. However, some alteration have been made to reduce the critical data path, especially the Forwarding in EXECUTE stage.
The bypass unit are migrated from the EXECUTE stage to the DECODE stage to improve timing.


## Features
* Classic 5-stage pipeline, including FETCH, DECODE, EXECUTE, MEM and WB.  
* Apply the Dynamic Branch Prediction technology to improve the branch accuracy. It contains a 2-bit branch predictor and a 1024 depth branch prediction buffer to predict the branch address.
Furthermore, it takes the jump instruction(j, jal, jr .etc) as specital branch instructions to deal with, and this can simplfy the jump implementation.  
* Implement the Forwarding and Stalling mechanism to solve the data-hazard.  
* A 2KB direct-mapped data-cache is added to accelerate memory access. This cache has 64 blocks and each block has 8 words. A cache controller is designed to connect the MIPS processor and the 64KB main memory.
The cache is implemented as LUT in Xilinx FPGAs, and the main memory is implemented as Block Rams(BRAM).  

## Instruction Class
This MIPS processor supports the basic instructions as bellow. Users can add extra instructions conveniently.
* **TYPE-R:** AND, OR, ADD, SUB, SLT, NOR, SLRV, SLLV
* **TYPE-I:** ADDI, ANDI, ORI, XORI, LUI
* **MEM:** LW, SW
* **BRANCH:** BEQ, BNE
* **JUMP:** J, JAL, JR

## Out-of-the Box Capabilities
Some testbenchs are providered. **All the codes are assembled by "mipsasm.exe", which is a MIPS assembler and simulator**
Out of the box Algorithms provided include:
* **Sort:** use the search-maximum method to sort an array.
* **Stack_sort:** use two stacks to sort an array.
* **Finonacci:** calculate the Fibonacci series.
* **Gcd:** calculate the gcd of two numbers
* **Function/fact:** test the function recursion. Accumulate the result in recursively way.

# Computer Architecture Projects Spring 2023

This repository contains a collection of projects completed as part of the Computer Architecture (CA) Course at UT-CE in Spring 2023. The projects involve designing and implementing various computer architecture concepts, primarily focusing on the RISC-V processor in different stages of its execution cycle.

## Project Descriptions

1. [CA1: Rat In Maze](#ca1-rat-in-maze)
2. [CA2: RiscV Single Cycle](#ca2-riscv-single-cycle)
3. [CA3: RiscV Multi Cycle](#ca3-riscv-multi-cycle)
4. [CA4: RiscV Pipeline](#ca4-riscv-pipeline)

### [CA1: Rat In Maze](https://github.com/inaijin/CA-CourseProjects/tree/main/CA1_Maze)
**Description**: In this project, we implemented a maze-solving algorithm entirely in hardware. The project involved designing proper hardware module segmentation and a Huffman controller to guide the rat through the maze.

**Features**:
- Hardware-based maze solving: Implemented using Verilog.
- Modular design: Segmented hardware modules for clarity and efficiency.
- Huffman controller: Manages the control logic for navigating the maze.

### [CA2: RiscV Single Cycle](https://github.com/inaijin/CA-CourseProjects/tree/main/CA2-RISCV-Single_Cycle)
**Description**: This project focused on implementing a single-cycle RISC-V processor. A single-cycle processor executes each instruction in one clock cycle, simplifying the control unit but increasing the cycle time due to the complexity of handling all instruction types in one cycle.

**Features**:
- Single-cycle execution: All instructions complete in one clock cycle.
- Simple control logic: Direct execution without pipelining.
- Basic RISC-V instruction set: Includes essential RISC-V instructions.

### [CA3: RiscV Multi Cycle](https://github.com/inaijin/CA-CourseProjects/tree/main/CA3_RISCV_Multi_Cycle)
**Description**: In this project, we designed a multi-cycle RISC-V processor. Unlike the single-cycle processor, the multi-cycle processor breaks down the instruction execution into multiple stages, each taking one clock cycle, which reduces the cycle time but requires more complex control logic.

**Features**:
- Multi-cycle execution: Instructions are divided into several stages.
- Efficient cycle time: Reduced per-stage cycle time.
- Detailed control unit: Handles the complexity of stage transitions.

### [CA4: RiscV Pipeline](https://github.com/inaijin/CA-CourseProjects/tree/main/CA4_RISCV_Pipe_Line)
**Description**: The final project involved implementing a pipelined RISC-V processor. Pipelining allows overlapping execution of multiple instructions by dividing the processor into stages. Each stage processes a different instruction concurrently, significantly improving the processor's throughput.

**Features**:
- Pipelined execution: Overlaps instruction execution for higher throughput.
- Stage-based design: Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB) stages.
- Hazard handling: Techniques to manage data and control hazards, such as forwarding and stalling.

## Contributing
Feel free to fork this repository, open issues, or submit pull requests. Any contributions are welcome!

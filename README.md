# Computer Organisation

This repository contains a collection of Verilog/SystemVerilog implementations for fundamental computer architecture components and processors, created as lab assignments for a Computer Organisation course.

## Overview

The repository includes various implementations of computer architecture concepts, from basic components to complete processors:

- **Single Cycle RISC-V Processor** - A complete implementation of a single-cycle RISC-V RV32I processor
- **Register Type Instruction Processor** - A simplified processor that handles R-type RISC instructions
- **Floating Point Operations** - IEEE-754 floating-point addition and multiplication units
- **Booth Multiplier** - Implementation of the Booth multiplication algorithm

## Project Structure

```
COMPUTER-ORGANISATION/
│
├── Single_Cycle_RISCV_Processor/     # Complete single-cycle RISC-V processor
│   ├── RTL/                          # Register Transfer Level designs
│   ├── TB/                           # Testbench
│   └── MemFiles/                     # Memory initialization files
│
├── Register_type_instruction_processor/  # R-type instruction processor
│   ├── RTL/                          # Implementation files
│   └── TB/                           # Testbench
│
├── floating_point_addition/          # IEEE-754 floating-point adder
│   ├── RTL/                          # Implementation files
│   └── TB/                           # Testbench
│
├── floating_point_multiplication/    # IEEE-754 floating-point multiplier
│   ├── RTL/                          # Implementation files
│   └── TB/                           # Testbench
│
└── Booth_multiplier_algo/            # Booth multiplication algorithm
    ├── RTL/                          # Implementation files
    └── TB/                           # Testbench
```

## Projects

### Single Cycle RISC-V Processor

A complete implementation of a single-cycle RISC-V processor following the RV32I instruction set architecture. All operations (instruction fetch, decode, execute, memory access, and writeback) are completed in a single clock cycle.

- **Features:**
  - Support for RV32I instruction set
  - Parameterized design for easy modification
  - Testing environment with pre-loaded programs
  - Matrix determinant calculation demonstration program

- **Key Components:**
  - Program Counter (PC) and control logic
  - Instruction memory and data memory
  - ALU and ALU control
  - Register file (32 x 32-bit)
  - Control unit for instruction decoding
  - Immediate value generator

### Register Type Instruction Processor

A simplified processor implementation focused on handling register-type (R-type) instructions.

- **Features:**
  - Register file integration
  - ALU operations for register-type instructions
  - Basic instruction decoding

### Floating Point Operations

IEEE-754 compliant implementations of fundamental floating-point operations:

#### Floating Point Addition
- Handles 32-bit single-precision float addition
- Implements normalization, alignment, and rounding
- Manages sign, exponent, and mantissa correctly

#### Floating Point Multiplication
- Implements 32-bit floating-point multiplication
- Handles sign, exponent addition, and mantissa multiplication
- Includes normalization and special case handling

### Booth Multiplier Algorithm

An implementation of the Booth multiplication algorithm, which is an efficient method for signed binary multiplication.

- **Features:**
  - Configurable bit width (parameterized design)
  - Sequential operation with clock control
  - Start/done signaling for integration into larger systems

## Usage

Each project contains:
- **RTL files** - The actual hardware description
- **Testbench files** - For simulating and verifying functionality

To run any of these implementations:

1. Install a hardware description language simulator like Xilinx Vivado, ModelSim, or Icarus Verilog
2. Load the design files (RTL) and testbench (TB) for the desired module
3. Compile and run the simulation
4. Analyze the waveforms and console output to verify functionality

## Requirements

- Xilinx Vivado (recommended) or other HDL simulator
- Basic understanding of digital logic and computer architecture
- Familiarity with Verilog/SystemVerilog

## License

This project is provided for educational purposes.

## Author

Computer Organization Course Projects

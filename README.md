# CSCI410 – Elements of Computing Systems

**Daniel Johnson**

Course projects implementing a complete computer system from the ground up, following the [nand2tetris](https://www.nand2tetris.org/) curriculum (*The Elements of Computing Systems* by Nisan & Schocken).

---

## Prerequisites

### nand2tetris Software Suite (Hardware Simulator, CPU Emulator, VM Emulator)

Projects 00–05 and 09 require the nand2tetris tools (Hardware Simulator, CPU Emulator, VM Emulator, Jack Compiler). Download and install the software suite from:

> https://www.nand2tetris.org/software

The suite runs on any platform with Java installed (JRE 11+).

### Ruby

Projects 06, 07, 08, and 10 are written in Ruby. Ruby 2.x or later is required.

```
ruby --version
```

---

## Project Overview & How to Run

### Project 00 – Getting Started

Orientation project. Familiarize yourself with the Hardware Simulator by loading the provided `.tst` test scripts (`And.tst`, `Mux8Way16.tst`, `Register.tst`, `RAM8.tst`) into the Hardware Simulator.

```
# Open the Hardware Simulator (from the nand2tetris tools directory):
HardwareSimulator.sh          # macOS / Linux
HardwareSimulator.bat         # Windows

# Then load a .tst file, e.g.:  project00/And.tst
```

---

### Projects 01–03 – Boolean Logic, Boolean Arithmetic & Sequential Logic

HDL chip implementations tested with the Hardware Simulator.

```bash
# From the nand2tetris tools directory, open the Hardware Simulator and load
# a test script from the relevant project folder, e.g.:
#   project01/And.tst
#   project02/ALU.tst
```

---

### Project 05 – Computer Architecture (CPU & Memory)

HDL implementations of the Hack CPU, Memory, and Computer chips.

```bash
# Load the following test scripts in the Hardware Simulator:
#   project05/CPU.tst
#   project05/Memory.tst
#   project05/ComputerAdd.tst
#   project05/ComputerMax.tst
#   project05/ComputerRect.tst
```

See `project05/README` for additional notes on the custom CPU test files.

---

### Project 06 – Assembler (Ruby)

Translates Hack assembly (`.asm`) programs into binary Hack machine code (`.hack`).

```bash
cd project06
ruby assembler.rb <program.asm>
```

**Examples:**

```bash
ruby assembler.rb add/Add.asm
ruby assembler.rb max/Max.asm
ruby assembler.rb rect/Rect.asm
ruby assembler.rb pong/Pong.asm
```

The output `.hack` file is written to the same directory as the input file.

---

### Project 07 – VM Translator Part I (Ruby)

Translates a single `.vm` file (arithmetic and memory-access commands) into Hack assembly.

```bash
cd project07
ruby vmTranslater.rb <file.vm>
```

**Example:**

```bash
ruby vmTranslater.rb test.vm
```

The output `.asm` file is written alongside the input file.

---

### Project 08 – VM Translator Part II (Ruby)

Extends the VM translator with program-flow and function-calling commands. Accepts either a single `.vm` file or a directory containing multiple `.vm` files.

```bash
cd project08
ruby vmTranslater.rb <file.vm>
# or
ruby vmTranslater.rb <directory/>
```

When given a directory, the translator combines all `.vm` files in it and writes a single `.asm` output file named after the directory.

---

### Project 10 – Syntax Analyzer / Compiler Front-End (Ruby)

Tokenizes and parses Jack source files (`.jack`), producing an XML parse tree.

```bash
cd project10
ruby file_handler.rb <file.jack>
# or
ruby file_handler.rb <directory/>
```

Output XML files (e.g. `MyClass_gen.xml`) are written alongside the input files.

---

### Project 12 – Jack OS Standard Library (Jack)

Jack-language implementations of the operating system classes (`Array`, `Keyboard`, `Math`, `Memory`, `Output`, `Screen`, `String`, `Sys`).

To test, use the Jack Compiler and VM Emulator from the nand2tetris tools suite:

```bash
# Compile all .jack files in a project directory using the supplied Jack compiler:
JackCompiler.sh project12/         # macOS / Linux
JackCompiler.bat project12\        # Windows

# Then load and run the resulting .vm files in the VM Emulator.
```

---

## Repository Structure

| Directory | Description |
|---|---|
| `project00/` | Getting started — Hardware Simulator orientation |
| `project01/` | Boolean logic gates (HDL) |
| `project02/` | Boolean arithmetic / ALU (HDL) |
| `project05/` | CPU, Memory, and Computer chip (HDL) |
| `project06/` | Assembler (Ruby) |
| `project07/` | VM Translator Part I (Ruby) |
| `project08/` | VM Translator Part II (Ruby) |
| `project09_james/` | Jack language game specification |
| `project10/` | Syntax Analyzer / Compiler front-end (Ruby) |
| `project12/` | Jack OS standard library (Jack) |

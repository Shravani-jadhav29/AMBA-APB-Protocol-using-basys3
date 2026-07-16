# AMBA APB3 Slave Protocol Implementation using Verilog HDL

## Project Overview

This project implements the **AMBA APB3 (Advanced Peripheral Bus v3) Slave Protocol** using **Verilog HDL**. The design follows the APB3 communication protocol and is intended for FPGA implementation and verification using Vivado.

The APB3 slave supports both read and write transactions through a finite state machine (FSM). The project demonstrates how low-speed peripherals communicate with an APB master in an AMBA-based System-on-Chip (SoC).

---

## Objectives

- Design an APB3 Slave using Verilog HDL.
- Implement the APB3 finite state machine.
- Support read and write operations.
- Generate PREADY and PSLVERR responses.
- Verify functionality through simulation.
- Implement and test the design on an FPGA.

---

## Features

- AMBA APB3 compliant slave interface
- Three-state FSM implementation
- Read operation support
- Write operation support
- Register-based memory
- PREADY signal generation
- PSLVERR error handling
- Synchronous design
- Active-high reset
- FPGA implementation using Vivado

---

## APB3 Signals

### Inputs

| Signal | Width | Description |
|---------|------|-------------|
| PCLK | 1 | APB Clock |
| PRESET | 1 | Reset |
| PSEL | 1 | Peripheral Select |
| PENABLE | 1 | Enable Signal |
| PWRITE | 1 | Read/Write Control |
| PADDR | 32 | Address Bus |
| PWDATA | 32 | Write Data |

### Outputs

| Signal | Width | Description |
|---------|------|-------------|
| PRDATA | 32 | Read Data |
| PREADY | 1 | Transfer Complete |
| PSLVERR | 1 | Error Response |

---

## APB3 State Machine

```
                +-------+
                | IDLE  |
                +-------+
                    |
                PSEL = 1
                    |
                    v
               +---------+
               | SETUP   |
               +---------+
                    |
          PENABLE = 1
                    |
                    v
               +---------+
               | ACCESS  |
               +---------+
               /         \
      Transfer Done    Wait State
          |                |
          +----------------+
                  |
                  v
               IDLE
```

---

## Read Operation

1. Master asserts **PSEL**
2. Slave enters SETUP state.
3. Master asserts **PENABLE**.
4. Slave places data on **PRDATA**.
5. Slave asserts **PREADY**.
6. Transfer completes.

---

## Write Operation

1. Master asserts **PSEL**
2. Address and write data become valid.
3. Master asserts **PENABLE**.
4. Slave stores **PWDATA** into the selected register.
5. Slave asserts **PREADY**.
6. Transfer completes.

---

## Project Structure

```
APB3_Project/
│
├── rtl/
│   ├── apb_slave.v
│   ├── apb_fsm.v
│   └── top.v
│
├── tb/
│   └── apb_tb.v
│
├── constraints/
│   └── top.xdc
│
├── simulation/
│
├── images/
│
└── README.md
```

---

## Design Flow

```
Requirement

↓

Protocol Study

↓

FSM Design

↓

Verilog Coding

↓

Simulation

↓

Functional Verification

↓

Synthesis

↓

Implementation

↓

Bitstream Generation

↓

FPGA Testing
```

---

## Simulation

Simulation verifies:

- Reset operation
- Read transaction
- Write transaction
- Valid address access
- Invalid address detection
- PREADY generation
- PSLVERR generation

---

## FPGA Verification

The design can be tested using:

- Push Buttons
- Slide Switches
- LEDs
- Seven Segment Display
- Integrated Logic Analyzer (ILA)

---

## Tools Used

- Vivado Design Suite
- Verilog HDL
- Xilinx FPGA
- XSim Simulator

---

## Applications

- UART Interface
- GPIO Controller
- SPI Controller
- I2C Controller
- Timer Module
- Memory-Mapped Peripheral Interface

---

## Learning Outcomes

After completing this project, you will understand:

- AMBA Architecture
- APB3 Protocol
- Finite State Machine (FSM) Design
- Memory-Mapped I/O
- FPGA Design Flow
- Verilog HDL Development
- Simulation and Verification
- Hardware Implementation

---

## Future Improvements

- APB4 implementation
- Multiple APB slaves
- APB bridge integration
- UART peripheral integration
- SPI peripheral integration
- I2C peripheral integration
- Interrupt support
- Register map expansion

---

## Author

**Shravani Shrikant Jadhav**

Electronics and Telecommunication Engineering

Rajarambapu Institute of Technology (RIT)

---

## License

This project is intended for educational and academic purposes.

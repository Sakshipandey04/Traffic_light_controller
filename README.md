# 🚦 Traffic Light Controller using Verilog (Vivado)

This project implements a **Traffic Light Controller FSM** using Verilog HDL.
The design simulates a **4-state traffic flow** between the **North-South** and **East-West** directions with configurable timings for green and yellow lights.

The controller is tested using a **Verilog testbench** in **Vivado Simulator** and verified using **RTL schematic** and waveforms.

## Features

*  **Configurable timing**

  * Green duration
  * Yellow duration
  * Parameterized clock frequency
* 🚦 **4-State FSM**

  * NS Green
  * NS Yellow
  * EW Green
  * EW Yellow
* Clean synchronous FSM implementation
* Complete testbench included
*  Verified on **Vivado 2020+**
* RTL schematic + waveform simulation

---

## FSM State Diagram

```
        ┌──────────────┐
        │  NS GREEN    │
        └──────┬───────┘
               │
               ▼
        ┌──────────────┐
        │ NS YELLOW     │
        └──────┬────────┘
               │
               ▼
        ┌──────────────┐
        │  EW GREEN     │
        └──────┬────────┘
               │
               ▼
        ┌──────────────┐
        │ EW YELLOW     │
        └──────┬────────┘
               │
               ▼
           Back to NS GREEN
```

---

##  Project Structure

```
traffic-light-controller/
│
├── src/
│   ├── traffic_light_controller.v
│   └── tb_traffic_light.v
│
├── README.md
└── vivado_project_files/
```

---

## 🛠 Verilog Implementation

### **Top Module: `traffic_light_controller.v`**

Implements:

* FSM
* State transitions
* One-second timer using clock frequency
* Traffic signal output control

### **Testbench: `tb_traffic_light.v`**

Includes:

* Clock generation
* Reset logic
* Simulation runtime
* Prints waveform transitions
  
   ```

---

##  Expected Waveform Output

* NS Green should stay ON for configured green time
* Then NS Yellow
* Then EW Green
* Then EW Yellow
* Repeats continuously

---

## Parameters You Can Modify

| Parameter       | Description        | Example    |
| --------------- | ------------------ | ---------- |
| `CLOCK_FREQ_HZ` | Clock freq in Hz   | `50000000` |
| `GREEN_TIME_S`  | Green time in sec  | `10`       |
| `YELLOW_TIME_S` | Yellow time in sec | `3`        |

---

##  Tools Used

* **Verilog HDL**
* **Xilinx Vivado** (any version 2020+)
* **Vivado Simulator**

---

## Contribution

Feel free to fork the repo and improve:

* Adding pedestrian signals
* Adding timer displays
* Implementing emergency vehicle priority
* 4-way adaptive traffic control

---
## Author
Sakshi Pandey
sakshipan14@gmail.com

Just tell me!

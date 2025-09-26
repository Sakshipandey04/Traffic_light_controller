# Traffic_light_controller
-

# **Traffic Light Controller Project (FSM)**

## **Project Overview**

The Traffic Light Controller project demonstrates the design of a digital traffic light system using a **Finite State Machine (FSM)** and counters to control the duration of each light state. The system cycles through **Green → Yellow → Red → Green** continuously, ensuring safe and efficient traffic flow.

The project is implemented in **Verilog HDL** and can be simulated or synthesized on an FPGA for practical applications.

---

## **Features**

* 3-state FSM: Green, Yellow, Red.
* Counter-based timing for each light state.
* Moore machine outputs: light outputs depend only on the current state.
* Easily extendable to multiple intersections, pedestrian signals, or emergency vehicle priority.
* FPGA-synthesizable design.

---

## **FSM State Diagram**

```
          +-----------+
          |   GREEN   |
          | Duration: |
          |   N sec   |
          +-----------+
                |
                v
          +-----------+
          |  YELLOW   |
          | Duration: |
          |   M sec   |
          +-----------+
                |
                v
          +-----------+
          |    RED    |
          | Duration: |
          |   P sec   |
          +-----------+
                |
                v
             (Back to GREEN)
```

* **GREEN:** Vehicles can move.
* **YELLOW:** Vehicles prepare to stop.
* **RED:** Vehicles must stop.

---

## **Implementation Details**

* **Module Name:** `traffic_light_fsm`
* **Inputs:**

  * `clk` : System clock.
  * `rst_n` : Active-low synchronous reset.
* **Outputs:**

  * `green` : Green light signal.
  * `yellow` : Yellow light signal.
  * `red` : Red light signal.
* **FSM Logic:**

  * The FSM transitions from GREEN → YELLOW → RED → GREEN.
  * Each state uses a **counter** to maintain its duration.
  * Outputs are based solely on the current state (Moore machine).

---

## **How to Run**

1. Open the project in **Quartus Prime** or your preferred Verilog simulator.
2. Set `traffic_light_fsm` as the top-level entity.
3. Simulate the design using the testbench `tb_traffic_light_fsm.v`.
4. Observe the outputs `green`, `yellow`, `red` to verify the correct sequence.

---

## **Files Included**

* `traffic_light_fsm.v` – Main Verilog module implementing FSM.
* `tb_traffic_light_fsm.v` – Testbench for simulation.
* `README.md` – Project description and instructions.

---

## **Applications**

* Urban traffic management systems.
* Pedestrian and vehicle signal coordination.
* Embedded system learning and FPGA projects.

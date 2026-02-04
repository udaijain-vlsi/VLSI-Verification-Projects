# VLSI Verification Projects

Hello! I am Udai Jain, a first-year B.Tech student in VLSI Design & Technology (with AI/ML Minor) at Vellore Institute of Technology (VIT) Vellore – Class of 2029.  

This repository contains my learning projects in Verilog HDL and VLSI verification.  
I am building a strong foundation in digital design and functional verification to pursue a career in VLSI (targeting verification / RTL design roles).

### Current Project: 4-bit Synchronous Counter Verification 

**Description**  
A simple 4-bit synchronous up-counter that increments by 1 on every positive clock edge.  

It resets to 0 when the active-high reset signal is asserted.

**What I Learned**  
- Writing Verilog modules with inputs, outputs, and sequential always blocks  
- Using non-blocking assignments (<=) for proper register behavior  
- Creating a basic testbench: clock generation, reset stimulus, and simple checking  
- Simulating and debugging using ModelSim waveform viewer  
- Understanding clock period, reset timing, and overflow behavior  

**Tools Used**  
- Language: Verilog HDL  
- Simulator: ModelSim (Student/Free Edition)  

**Source Files**:
- [counter.v](https://github.com/user-attachments/files/25015385/counter.v)→ RTL design module
- [tb_counter.v](https://github.com/user-attachments/files/25015393/tb_counter.v)→ Testbench with clock generation and stimulus
  
## Design File :counter.v
    module counter (
    input clk,
    input rst,
    output reg [3:0] cnt);
    always @(posedge clk or posedge rst) 
    begin
    if (rst) cnt <= 4'b0000;
    else     cnt <= cnt + 1;
    end
    endmodule

## Testbench File :tb_counter.v
    module tb_counter;
    reg clk, rst;
    wire [3:0] cnt;
    counter dut (.clk(clk), .rst(rst), .cnt(cnt));
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    initial begin
    rst = 1;     
    #15 rst = 0; 
    #200 $finish; 
    end
    always @(posedge clk) begin
    if (cnt >= 16) $display("ERROR: Counter overflow!");
    end
    endmodule

## Waveform ScreenS
<img width="796" height="77" alt="waveform PNG" src="https://github.com/user-attachments/assets/c66fb1c7-2282-4ed1-8abb-34087e7a8873" />
**Simulation Waveform** (showing reset pulse, clock toggling, cnt incrementing from 0 to 15, and reset behavior)

**Goal**  
Secure a Summer 2026 internship / trainee role in VLSI Verification or RTL Design (preferably in Bangalore – Maven Silicon, ChipXpert, or semiconductor startups).  
Actively learning Digital System Design, Electronic Devices, and Verilog through VIT curriculum.

Open to feedback, suggestions, and guidance from seniors or professionals in the VLSI domain!

Thank you for visiting! 🚀 

Next up: Synchronous FIFO verification – adding in a week.

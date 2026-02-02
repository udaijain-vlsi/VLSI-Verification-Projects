# 4-bit Synchronous Counter Verification

This is my first Verilog project – a simple 4-bit synchronous counter that increments by 1 on every positive clock edge and resets to zero when reset is high.

### What I Learned:
- How to create a Verilog module  
- Generating clock in a testbench  
- Implementing and testing reset logic  
- Analyzing waveforms for verification  

### Tools Used:
- ModelSim (for simulation and waveform viewing)  

### Goal:
Applying for Summer 2026 VLSI Verification internship (B.Tech VLSI Design & Technology, VIT Vellore).  

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

## Waveform ScreenShot
<img width="796" height="77" alt="waveform PNG" src="https://github.com/user-attachments/assets/c66fb1c7-2282-4ed1-8abb-34087e7a8873" />

Currently in the learning phase – any feedback or suggestions are welcome!

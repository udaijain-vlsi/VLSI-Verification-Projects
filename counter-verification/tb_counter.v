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

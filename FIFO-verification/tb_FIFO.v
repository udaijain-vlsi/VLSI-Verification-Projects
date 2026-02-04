module tb_fifo;
reg clk, rst, wr_en, rd_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full, empty, led;
fifo dut (
.clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en),
.data_in(data_in), .data_out(data_out),
.full(full), .empty(empty), .led(led)
);
initial begin
clk = 0;
forever #5 clk = ~clk;
end
initial begin
rst = 1; wr_en = 0; rd_en = 0;
#20 rst = 0;
repeat(8) begin
wr_en = 1; data_in = $random;
#10 wr_en = 0; #10;
end
repeat(8) begin
rd_en = 1; #10 rd_en = 0; #10;
end
#100 $finish;
end
endmodule

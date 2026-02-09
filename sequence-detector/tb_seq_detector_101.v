module tb_seq_detector_101;

reg clk;
reg rst;
reg serial_in;
wire detected;
wire error;
wire [6:0] seg_out;
    
seq_detector_101 dut (
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .detected(detected),
    .error(error),
    .seg_out(seg_out)
);

always #10 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    serial_in = 0;

    #40 rst = 0;

    #20 serial_in = 1;
    #20 serial_in = 0;
    #20 serial_in = 1;

    #40 serial_in = 0;
    #20 serial_in = 1;
    #20 serial_in = 0;
    #20 serial_in = 1;
    #20 serial_in = 0;
    #20 serial_in = 1;

    #40 rst = 1;
    #20 rst = 0;
    #20 serial_in = 1;
    #20 serial_in = 0;
    #20 serial_in = 0;

    #100 $finish;
end

initial begin
    $monitor("Time=%0t rst=%b in=%b det=%b err=%b seg=%b", $time, rst, serial_in, detected, error, seg_out);
end

endmodule

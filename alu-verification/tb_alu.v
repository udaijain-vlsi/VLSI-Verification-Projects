`timescale 1ns / 1ps

module tb_alu;

reg [3:0] a;
reg [3:0] b;
reg [1:0] op;
wire [3:0] result;
wire zero;

alu_4bit dut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .zero(zero)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, tb_alu);

    
    a = 4'b0101; b = 4'b0011; op = 2'b00; #10;  
    a = 4'b1010; b = 4'b0101; op = 2'b01; #10;  
    a = 4'b1100; b = 4'b1010; op = 2'b10; #10;  
    a = 4'b0011; b = 4'b0101; op = 2'b11; #10;  
    a = 4'b0000; b = 4'b0000; op = 2'b00; #10;  

    #100 $finish;
end

initial $monitor("Time=%0t | op=%b | a=%b b=%b | res=%b zero=%b", $time, op, a, b, result, zero);

endmodule

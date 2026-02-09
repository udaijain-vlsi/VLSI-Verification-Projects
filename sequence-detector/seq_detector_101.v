module seq_detector_101 (
    input wire clk,
    input wire rst,
    input wire serial_in,
    output reg detected,
    output reg error,
    output reg [6:0] seg_out
);
    
localparam S0 = 2'b00;
localparam S1 = 2'b01;
localparam S2 = 2'b10;
localparam S3 = 2'b11;

reg [1:0] state;
reg [1:0] next_state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= S0;
    end else begin
        state <= next_state;
    end
end

always @(*) begin
    next_state = state;
    detected = 1'b0;
    error = 1'b0;
    seg_out = 7'b1111111;

    case (state)
        S0: begin
            if (serial_in == 1'b1) next_state = S1;
        end
        S1: begin
            if (serial_in == 1'b0) next_state = S2;
            else next_state = S1;
        end
        S2: begin
            if (serial_in == 1'b1) begin
                next_state = S3;
                detected = 1'b1;
                seg_out = 7'b1000010;
            end else begin
                next_state = S0;
                error = 1'b1;
                seg_out = 7'b0000110;
            end
        end
        S3: begin
            if (serial_in == 1'b0) next_state = S2;
            else begin
                next_state = S1;
                error = 1'b1;
                seg_out = 7'b0000110;
            end
        end
        default: next_state = S0;
    endcase
end

endmodule

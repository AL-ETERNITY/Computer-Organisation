`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 15:14:53
// Design Name: 
// Module Name: booth_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module booth_multiplier #(parameter N = 4) (
    input clk,
    input start,
    input signed [N-1:0] multiplicand,
    input signed [N-1:0] multiplier,
    output reg signed [2*N-1:0] product,
    output reg done
);
    
    reg signed [2*N-1:0] A;  // Accumulator
    reg signed [N-1:0] M;    // Multiplicand
    reg signed [N:0] Q;      // Multiplier (Extra Q-1 bit)
    reg [N-1:0] count;       // Counter for iterations

    always @(posedge clk) begin
        if (start) begin
            // Initialize registers
            A = 0;
            M = multiplicand;
            Q = {multiplier, 1'b0};  // Concatenated Q with Q-1 (initialized to 0)
            count = N;
            done = 0;
        end
        else if (count > 0) begin
            // Booth Encoding Logic
            case (Q[1:0])  // Check Q0 and Q-1
                2'b01: A = A + M;  // Add multiplicand
                2'b10: A = A - M;  // Subtract multiplicand
                default: ;         // No operation for 00 or 11
            endcase
            
            // Arithmetic Right Shift (ASR) for A and Q
            {A, Q} = {A[2*N-1], A, Q[N:1]};  

            // Decrement counter
            count = count - 1;

            // Check completion
            if (count == 0) begin
                product = {A, Q[N:1]};  // Store final result
                done = 1;
            end
        end
    end
endmodule

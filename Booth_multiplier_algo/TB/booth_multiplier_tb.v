`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 15:15:54
// Design Name: 
// Module Name: booth_multiplier_tb
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


module booth_multiplier_tb;
    parameter N = 4;
    reg clk;
    reg start;
    reg signed [N-1:0] multiplicand;
    reg signed [N-1:0] multiplier;
    wire signed [2*N-1:0] product;
    wire done;

    // Instantiate Booth's Multiplier
    booth_multiplier #(N) uut (
        .clk(clk),
        .start(start),
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product),
        .done(done)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        start = 0;

        // Test 1: 3 * 2 = 6
        multiplicand = 3; multiplier = 2; start = 1;
        #10 start = 0; wait(done);
        $display("Test 1: %d * %d = %d", multiplicand, multiplier, product);

        // Test 2: -3 * 2 = -6
        #10 multiplicand = -3; multiplier = 2; start = 1;
        #10 start = 0; wait(done);
        $display("Test 2: %d * %d = %d", multiplicand, multiplier, product);

        // Test 3: -3 * -2 = 6
        #10 multiplicand = -3; multiplier = -2; start = 1;
        #10 start = 0; wait(done);
        $display("Test 3: %d * %d = %d", multiplicand, multiplier, product);

        // Test 4: 7 * -4 = -28
        #10 multiplicand = 7; multiplier = -4; start = 1;
        #10 start = 0; wait(done);
        $display("Test 4: %d * %d = %d", multiplicand, multiplier, product);

        // Test 5: -8 * -3 = 24
        #10 multiplicand = -8; multiplier = -3; start = 1;
        #10 start = 0; wait(done);
        $display("Test 5: %d * %d = %d", multiplicand, multiplier, product);

        // End simulation
        #10 $stop;
    end
endmodule

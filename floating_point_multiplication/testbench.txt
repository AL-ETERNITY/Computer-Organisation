`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:43:10 05/07/2016
// Design Name:   mul
// Module Name:   /home/hayder/Verilog/float_mul/mul_tb.v
// Project Name:  float_mul
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module mul_tb;
    reg [31:0] a,b;
    wire [31:0] r;

    mul uut(.a(a), .b(b), .r(r));
    initial begin
       a = 32'h3F800000; b = 32'h40000000;
    end
endmodule

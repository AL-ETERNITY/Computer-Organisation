`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 14:48:03
// Design Name: 
// Module Name: fp_adder_tb
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


module fp_adder_tb;
    
  reg [31:0] a, b;
  wire [31:0] r;
  fp_adder uut(.a(a), .b(b), .r(r));
  
  initial begin
    a = 32'h3F800000; // 1.0
    b = 32'h40000000; // 2.0
   #10;
  
   $display("a=%h b=%h => r=%h", a, b, r);

    a = 32'h40600000; // 3.5
    b = 32'h40880000; // 4.25
    #10;
    
    $display("a=%h b=%h => r=%h", a, b, r);

    a = 32'hC0000000; // -2.0
    b = 32'h3F800000; // 1.0
    
    #10;
    $display("a=%h b=%h => r=%h", a, b, r);

    #10 $finish;
  end
endmodule

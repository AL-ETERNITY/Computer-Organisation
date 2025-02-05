`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 14:39:48
// Design Name: 
// Module Name: fp_adder
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


module fp_adder(input [31:0] a, input [31:0] b, output reg [31:0] r);

 reg sA, sB, sR;
 reg [7:0] eA, eB, eR;
 reg [23:0] mA, mB;
 reg [24:0] t;

 always @* begin
    sA = a[31]; 
   eA = a[30:23]; 
    mA = {1'b1, a[22:0]}; 

   sB = b[31]; 
    eB = b[30:23]; 
   mB = {1'b1, b[22:0]};

    if(eA > eB) begin
      mB = mB >> (eA - eB);
     eR = eA;
      sR = sA;
   end else begin
      mA = mA >> (eB - eA);
     eR = eB;
      sR = sB;
    end

    if(sA == sB) 
      t = mA + mB;
   else if(mA >= mB) 
      t = mA - mB;
   else begin
         t = mB - mA;
      sR = ~sR; 
    end

    if(t[24]) begin
      t = t >> 1;
      eR = eR + 1;
    end else if(~t[23] && t != 0) begin
      t = t << 1;
      eR = eR - 1;
    end

    if(t == 0) eR = 0;
    r = {sR, eR, t[22:0]};
  end

endmodule

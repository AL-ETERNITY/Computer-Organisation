`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.02.2025 12:01:55
// Design Name: 
// Module Name: mul
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


module mul (input[31:0] a, input [31:0] b, output reg [31:0] r);
 reg s;
 reg[7:0] e;
 reg[23:0] ma,mb;
 reg[47:0] prod;
 
 always @* begin
     s = a[31]^b[31];
     e = a[30:23] + b[30:23] - 8'd127;
     ma = {1'b1, a[22:0]}; 
     mb = {1'b1, b[22:0]}; 
     prod = ma*mb;
     if(prod[47]) begin
        prod = prod>>1;
        e = e + 1;
        end else if(!prod[46] && prod != 0) begin
            while(!prod[46] && e>0) begin
                prod = prod<<1;
                e = e - 1;
            end
        end
           if(prod == 0) e=0;
           r = {s, e, prod[45:23]};
     end     
endmodule

`timescale 1ns / 1ps

module Register_File (
    input   clk,
    input    WE,           
    input      [4:0]  rs1_addr,    
    input      [4:0]  rs2_addr,     
    input    [4:0]  rd_addr,      
    input      [31:0] rd_data,     
    output    [31:0] rs1,        
    output     [31:0] rs2       
);

   reg [31:0] registers[31:0];
   
   assign rs1 = (rs1_addr == 0) ? 32'b0 : registers[rs1_addr];
   assign rs2 = (rs2_addr == 0) ? 32'b0 : registers[rs2_addr];
   
   always @(posedge clk) begin
      if (WE && (rd_addr != 0)) begin
         registers[rd_addr] <= rd_data;
      end
   end
   
   // For simulation: initialize some registers (x1 = 10, x2 = 5)
   integer i;
   initial begin
      for(i = 0; i < 32; i = i + 1)
         registers[i] = 32'b0;
      registers[1] = 32'd10;
      registers[2] = 32'd5;
   end

endmodule
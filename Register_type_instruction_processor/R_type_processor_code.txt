`timescale 1ns / 1ps

module R_type_processor(
    input         clk,
    input  [31:0] instruction,   
    output [31:0] alu_result     
);

   wire [4:0] rs1_addr = instruction[19:15];
   wire [4:0] rs2_addr = instruction[24:20];
   wire [4:0] rd_addr  = instruction[11:7];

  wire [31:0] reg_rs1, reg_rs2;
   wire [31:0] alu_out;
   
      wire WE = (instruction[6:0] == 7'b0110011);
   
  
   Register_File RF (
       .clk(clk),
       .WE(WE),
       .rs1_addr(rs1_addr),
       .rs2_addr(rs2_addr),
       .rd_addr(rd_addr),
       .rd_data(alu_out),
       .rs1(reg_rs1),
       .rs2(reg_rs2)
   );
   
  
   alu_with_memory ALU (
       .instruction(instruction),
       .rs1(reg_rs1),
       .rs2(reg_rs2),
       .rd(alu_out)
   );
   
  
   assign alu_result = alu_out;

endmodule
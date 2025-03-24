`timescale 1ns / 1ps

module alu_with_memory (
    input  [31:0] instruction,  
    input  [31:0] rs1,          
    input  [31:0] rs2,          
    output reg [31:0] rd        
);

  
  wire [6:0] opcode  = instruction[6:0];
  wire [2:0] funct3  = instruction[14:12];
  wire [6:0] funct7  = instruction[31:25];
  
  always @(*) begin
    
    if (opcode == 7'b0110011) begin
      case (funct3)
        3'b000: begin
          
          if (funct7 == 7'b0100000)
            rd = rs1 - rs2;  // SUBTRACT
          else
            rd = rs1 + rs2;  // ADD
        end

        3'b100: begin
          // XOR operation
          rd = rs1 ^ rs2;
        end

        3'b101: begin
          // SRL (logical right shift) or SRA (arithmetic right shift)
          if (funct7 == 7'b0100000)
            rd = $signed(rs1) >>> rs2[4:0];  // SRA
          else
            rd = rs1 >> rs2[4:0];            // SRL
        end

        3'b110: begin
          // OR operation
          rd = rs1 | rs2;
        end

        3'b111: begin
          // AND operation
          rd = rs1 & rs2;
        end

        default: rd = 32'b0;
      endcase
    end
    else begin
      rd = 32'b0;
    end
  end

endmodule
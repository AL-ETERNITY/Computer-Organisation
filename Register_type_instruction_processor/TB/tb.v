`timescale 1ns / 1ps

module tb;

    reg clk;
    reg [31:0] instruction;
    wire [31:0] alu_result;


    R_type_processor uut (
         .clk(clk),
         .instruction(instruction),
         .alu_result(alu_result)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
         $monitor("Time=%0t | Instruction=0x%h | ALU_Result=0x%h", $time, instruction, alu_result);
         
        
         #10;
         
         instruction = {7'b0000000, 5'd2, 5'd1, 3'b000, 5'd5, 7'b0110011};
         #10;
         
        
         instruction = {7'b0100000, 5'd2, 5'd1, 3'b000, 5'd5, 7'b0110011};
         #10;
         
         $finish;
    end

endmodule
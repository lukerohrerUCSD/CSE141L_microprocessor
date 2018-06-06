/* Filename: ALU_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the testbench for the ALU Module
*/

module ALU_tb;

  // DUT Input Drivers
  bit [1:0] ALUOp;
  bit [7:0] ALUSrcA;
  bit [7:0] ALUSrcB;

  // DUT Output Drivers
  wire Zero;
  wire [7:0] Result;

  // ALUOp Mnemonic
  ///ALUOp_mne op_name;

  // Instantiate UUT (Unit Under Test)
  ALU uut(.*);

  initial begin

    // Wait 40ns for global reset to finish
    #40ns;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    ALUSrcA = 8'b00010001;
    ALUSrcB = 8'b00010001; 

    // Test all ALU Operations
    #20ns ALUOp = 2'b00; // AND
    #20ns ALUOp = 2'b01; // ADD
    #20ns ALUOp = 2'b10; // XOR
    #20ns ALUOp = 2'b11; // SUB

    //pause for next test case
    #20ns;

 // Set ALUSrcA and ALUSrcB for Test Case 2:
    ALUSrcA = 8'b11110000;
    ALUSrcB = 8'b00001111; 

    // Test all ALU Operations
    #20ns ALUOp = 2'b00; // AND
    #20ns ALUOp = 2'b01; // ADD
    #20ns ALUOp = 2'b10; // XOR
    #20ns ALUOp = 2'b11; // SUB

    //pause for next test case
    #20ns;

 // Set ALUSrcA and ALUSrcB for Test Case 3:
    ALUSrcA = 8'b10101010;
    ALUSrcB = 8'b01010101; 

    // Test all ALU Operations
    #20ns ALUOp = 2'b00; // AND
    #20ns ALUOp = 2'b01; // ADD
    #20ns ALUOp = 2'b10; // XOR
    #20ns ALUOp = 2'b11; // SUB

    //pause for next test case
    #20ns;

    // End the testbench here
    #20ns $stop;
  end

  always_comb begin
    // Assign the ALUOp Mnemonic depenging on ALUOp
    //top_name = ALUOp_mne'(ALUOp);
  end

endmodule

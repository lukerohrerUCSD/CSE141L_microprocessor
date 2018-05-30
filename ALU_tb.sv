/* Filename: ALU_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the testbench for the ALU Module
*/
/*
module ALU_tb;

  // DUT Input Drivers
  bit [3:0] ALUOp;
  bit [7:0] ALUSrcA;
  bit [7:0] ALUSrcB;
  bit [7:0] ALUSrcC;

  // DUT Output Drivers
  wire OvOutALU;
  wire [7:0] Result;

  // ALUOp Mnemonic
  ALUOp_mne op_name;

  // Instantiate UUT (Unit Under Test)
  ALU uut(.*);

  initial begin

    // Wait 40ns for global reset to finish
    #40ns;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    // A = 128(unsigned)/ -128(signed)
    // B = 127(unsigned)/ 127(signed)
    ALUSrcA = 8'h80;
    ALUSrcB = 8'h7F;
    ALUSrcC = 8'h01;

    // Test all ALU Operations
    #20ns ALUOp = kADD;
    #20ns ALUOp = kSUB;
    #20ns ALUOp = kAND;
    #20ns ALUOp = kOR;
    #20ns ALUOp = kSLL;
    #20ns ALUOp = kSRL;
    #20ns ALUOp = kSLT;
    #20ns ALUOp = kSLTU;
    #20ns ALUOp = kTWCMP;
    #20ns ALUOp = kABS;

    //pause for next test case
    #20ns;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    // A = 127(unsigned)/ 127(signed)
    // B = 128(unsigned)/ -128(signed)
    ALUSrcA = 8'h7F;
    ALUSrcB = 8'h80;

    // Test all ALU Operations
    #20ns ALUOp = kADD;
    #20ns ALUOp = kSUB;
    #20ns ALUOp = kAND;
    #20ns ALUOp = kOR;
    #20ns ALUOp = kSLL;
    #20ns ALUOp = kSRL;
    #20ns ALUOp = kSLT;
    #20ns ALUOp = kTWCMP;
    #20ns ALUOp = kABS;

    //pause for next test case
    #20ns;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    // A = 128(unsigned)/ -128(signed)
    // B = 128(unsigned)/ -128(signed)
    ALUSrcA = 8'h80;
    ALUSrcB = 8'h80;

    // Test all ALU Operations
    #20ns ALUOp = kADD;
    #20ns ALUOp = kSUB;
    #20ns ALUOp = kAND;
    #20ns ALUOp = kOR;
    #20ns ALUOp = kSLL;
    #20ns ALUOp = kSRL;
    #20ns ALUOp = kSLT;
    #20ns ALUOp = kTWCMP;
    #20ns ALUOp = kABS;

    //pause for next test case
    #20ns;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    // A = 127(unsigned)/ 127(signed)
    // B = 127(unsigned)/ 127(signed)
    ALUSrcA = 8'h7F;
    ALUSrcB = 8'h7F;

    // Test all ALU Operations
    #20ns ALUOp = kADD;
    #20ns ALUOp = kSUB;
    #20ns ALUOp = kAND;
    #20ns ALUOp = kOR;
    #20ns ALUOp = kSLL;
    #20ns ALUOp = kSRL;
    #20ns ALUOp = kSLT;
    #20ns ALUOp = kTWCMP;
    #20ns ALUOp = kABS;

    // End the testbench here
    #20ns $stop;
  end

  always_comb begin
    // Assign the ALUOp Mnemonic depenging on ALUOp
    op_name = ALUOp_mne'(ALUOp);
  end

endmodule
*/
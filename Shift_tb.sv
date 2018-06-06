/* Filename: Shift_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the testbench for the Shift Module
*/

module Shift_tb;

  // DUT Input Drivers
  bit [2:0] Shamt;
  bit [7:0] Source;
  bit Shift;

  // DUT Output Drivers
  wire [7:0] Result;

  // ALUOp Mnemonic
  ///ALUOp_mne op_name;

  // Instantiate UUT (Unit Under Test)
  Shift uut(.*);

  initial begin

    // Wait 40ns for global reset to finish
    #40ns;

    Shift = 1;

    // Set ALUSrcA and ALUSrcB for Test Case 1:
    Source = 8'b00010000;

    // Test all shift amounts
    #20ns Shamt = 3'b000;
    #20ns Shamt = 3'b001;
    #20ns Shamt = 3'b010;
    #20ns Shamt = 3'b011;
    #20ns Shamt = 3'b100;
    #20ns Shamt = 3'b101;
    #20ns Shamt = 3'b110;
    #20ns Shamt = 3'b111;

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

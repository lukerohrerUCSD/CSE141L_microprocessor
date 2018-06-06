/* Filename: InstrROM_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the testbench for the ALU Module
*/

module InstrROM_tb;

  // DUT Input Drivers
  bit [7:0] InstrAddress; 

  // DUT Output Drivers
  wire [8:0] InstrOut;

  // ALUOp Mnemonic
  ///ALUOp_mne op_name;

  // Instantiate UUT (Unit Under Test)
  InstrROM uut(.*);

  initial begin

    // Wait 40ns for global reset to finish
    #40ns;
	
    #200ns InstrAddress = 8'h00;

    #100000ns;

    // End the testbench here
    #20ns $stop;
  end

  always_comb begin
    // Assign the ALUOp Mnemonic depenging on ALUOp
    //top_name = ALUOp_mne'(ALUOp);
  end

endmodule

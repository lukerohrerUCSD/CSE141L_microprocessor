/* Filename: OvReg_tb.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/4/16
 * Description: This file defines the test bench for the overflow register file module
*/

module OvReg_tb;

  // DUT Input Drivers
  bit CLK;
  bit dataIn;
  bit OvWrite;

  // DUT Output Drivers
  wire ovOut;

  // Instantiate UUT (unit under test)
  OvReg uut(.*);

  initial begin

    // Wait 100ns for global reset to finish
    #100ns;

    // Check if writing to overflow register works, data input is 1
    dataIn = 1;
    OvWrite = 1;
    #20ns;

    // Check if writing to overflow register doesn't work with OvWrite deasserted
    dataIn = 0;
    OvWrite = 0;
    #20ns;

    // Check if writing to overflow register works again, data input is 0
    dataIn = 0;
    OvWrite = 1;
    #20ns;

    // End the Test
    #20ns $stop;

  end

  always begin
    // Alternate clock for period of 20ns
   	#10ns CLK = 1;
   	#10ns CLK = 0;
  end

endmodule

/* Filename: Patr_tb.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/4//16
 * Description: This file defines the test bench for pattern check module
*/

import definitions::*;
module Patr_tb;

  // DUT Input Drivers
  bit [7:0] PatrSrcA;
  bit [7:0] PatrSrcB;

  // DUT Output Drivers
  wire PatrOut;

  // Position number and PatternPosition Menmonic to
  // show which position I am testing in the byte
  bit [3:0] position;
  BitPosition_mne PatternPosition;

  // Instantiate UUT (Unit Under Test)
  Patr uut(.*);

  initial begin
    // Set bit pattern to check against
    PatrSrcB = 8'b00001010;

    // Test if Patten is in [3:0] (Position 1), then if it isnt.
    position = 3'd1;
    #20ns PatrSrcA = 8'b00001010;
    #20ns PatrSrcA = 8'b00000000;

    // Test if Patten is in [4:1] (Position 2), then if it isnt.
    position = 3'd2;
    #20ns PatrSrcA = 8'b00010100;
    #20ns PatrSrcA = 8'b00000000;

    // Test if Patten is in [5:2] (Position 3), then if it isnt.
    position = 3'd3;
    #20ns PatrSrcA = 8'b00101000;
    #20ns PatrSrcA = 8'b00000000;

    // Test if Patten is in [6:3] (Position 4), then if it isnt.
    position = 3'd4;
    #20ns PatrSrcA = 8'b01010000;
    #20ns PatrSrcA = 8'b00000000;

    // Test if Patten is in [7:4] (Position 5), then if it isnt.
    position = 3'd5;
    #20ns PatrSrcA = 8'b10100000;
    #20ns PatrSrcA = 8'b00000000;

    // For the above tests, we should see PatrOut alternating high-low every 20ns
    // End the testbench here
    #20ns $stop;
  end

  always_comb begin
    // Assign the BitPosition Menmonic depending on current position thats being checked
    PatternPosition = BitPosition_mne'(position);
  end
endmodule

/* Filename: Patr.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/4/16
 * Description: This file defines the pattern check module
*/

module Patr(
  input [7:0] PatrSrcA,      // Byte to check if pattern exists in five 4-bit locations
  input [7:0] PatrSrcB,      // Byte that contains 4-bit patter at LSB to check for

  output logic PatrOut       // Output that gets set high if a patter exists in byte
);

  // Combinational operation only (not clocked)
  always_comb begin
    // XOR the five 4-bit positions of the byte to check with the
    // 4-bit patter to check against. If anyone is the same, then
    // set PatrOut high. Otherwise set low.
    if ( (PatrSrcA[3:0] ^ PatrSrcB[3:0]) == 4'd0 ||
         (PatrSrcA[4:1] ^ PatrSrcB[3:0]) == 4'd0 ||
         (PatrSrcA[5:2] ^ PatrSrcB[3:0]) == 4'd0 ||
         (PatrSrcA[6:3] ^ PatrSrcB[3:0]) == 4'd0 ||
         (PatrSrcA[7:4] ^ PatrSrcB[3:0]) == 4'd0 )
      PatrOut = 1;      // Set output high, since pattern was found
    else
      PatrOut = 0;      // Set output low, since pattern was NOT found
  end
endmodule

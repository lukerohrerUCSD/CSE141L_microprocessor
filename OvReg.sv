/* Filename: OvReg.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/4/16
 * Description: This file defines the overflow register file module
*/

module OvReg(
  input CLK,              // Clock input
  input dataIn,           // 1 bit overflow data input to be written
  input OvWrite,          // Control signal to allow write to overflow register

  output logic ovOut      // Overflow data output
);

  // 1 bit wide overflow register
  logic overflowRegister;

  // Combinational read output for overflow
  always_comb ovOut = overflowRegister;

  // Sequential (clocked) write of Overflow Register
  always_ff @ (posedge CLK)
    // If OvWrite asserted, then set overflow register to data in
    if(OvWrite)
      overflowRegister <= dataIn;

endmodule

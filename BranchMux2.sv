/* Filename: OvInputMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for Overflow Input Mux
*/

module BranchMux2 (
  input [7:0] Source1,
  input [7:0] Source2,
  input Branch,
  output logic [7:0] BrMux2
  );

  // Always do this Combinationally
  always_comb begin
    case(Branch)

      // Select Source2 (ReadReg2)
      0 : BrMux2 = Source2;

      // Select Source1 (ReadR1)
      1 : BrMux2 = Source1;

    endcase
  end
endmodule

/* Filename: CopyMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for CopyMux
*/

module CopyMux (
  input [7:0] Source1,
  input [7:0] Source2,
  input Copy,
  output logic [7:0] CpyMux
  );

  // Always do this Combinationally
  always_comb begin
    case(Copy)

      // Select Source1 (BrMux2)
      0 : CpyMux = Source1;

      // Select Source2 (0)
      1 : CpyMux = Source2;

    endcase
  end
endmodule

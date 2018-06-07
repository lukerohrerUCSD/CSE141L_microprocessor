/* Filename: ShiftALUMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for ShiftALUMux
*/

module ShiftALUMux (
  input [7:0] Source1,
  input [7:0] Source2,
  input Shift,
  output logic [7:0] SAMux
  );

  // Always do this Combinationally
  always_comb begin
    case(Shift)

      // Select Source2 (SAMux)
      0 : SAMux = Source2;

      // Select Source1 (ALUOut)
      1 : SAMux = Source1;

    endcase
  end
endmodule

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

      // Select Source1 (SAMux)
      0 : SAMux = Source1;

      // Select Source2 (DataMemOut)
      1 : SAMux = Source2;

    endcase
  end
endmodule

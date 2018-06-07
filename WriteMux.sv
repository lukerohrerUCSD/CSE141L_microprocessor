/* Filename: WriteMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for WriteMux
*/

module WriteMux (
  input [7:0] Source1,
  input [7:0] Source2,
  input Load,
  output logic [7:0] WMux
  );

  // Always do this Combinationally
  always_comb begin
    case(Load)

      // Select Source2 (ReadReg1)
      0 : WMux = Source1;

      // Select Source1 (ReadR0)
      1 : WMux = Source2;

    endcase
  end
endmodule

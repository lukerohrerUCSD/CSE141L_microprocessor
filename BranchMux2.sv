/* Filename: OvInputMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for Overflow Input Mux
*/

module OvInputMux (
  input [1:0] OvSel,              // 2-bit Select line or OvInputMux
  input CLSBOv,                   // Input 0 - CLSBOv
  input PatrOut,                  // Input 1 - PatrOut
  input OvOutALU,                 // Input 2 - OvOutputALU
  output logic OvInputMuxData     // Output 
  );

  // Always do this Combinationally
  always_comb begin
    case(OvSel)
      // Select CLSBOv
      0 : OvInputMuxData = CLSBOv;

      // Select PatrOut
      1 : OvInputMuxData = PatrOut;

      // Select OvOutALU
      2 : OvInputMuxData = OvOutALU;

      // Default Case - Do Nothing
      default: begin
      OvInputMuxData = 1'b0;
      end
    endcase
  end
endmodule

/* Filename: OvInputMux.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the the plumbing module for Overflow Input Mux
*/

module OvInputMux (
  input Shift,                      // Input 1 - Shift
  input readReg1,                   // Read Register
  input [2:0] Shamt,               
  output Result


  );

  /*
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
  */
endmodule

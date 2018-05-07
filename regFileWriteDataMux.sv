/* Filename: regFileWriteDataMux.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/15/16
 * Description: This file contains the the plumbing module for Register File Write Data Input Mux
*/

module regFileWriteDataMux (
  input [1:0] WriteValSel,              // 2-bit Select line for regFileWriteDataMux
  input [7:0] Result,                   // Input 0 - Result (from ALU)
  input [7:0] UImmediate,               // Input 1 - Unsigned Immediate (from Instruction)
  input [7:0] DataMemOut,               // Input 2 - DataMemOut
  output logic [7:0] regFileWriteData   // Output
  );

  // Always do this Combinationally
  always_comb begin
    case(WriteValSel)
      // Select Result
      0 : regFileWriteData = Result;

      // Select UImmediate
      1 : regFileWriteData = UImmediate;

      // Select DataMemOut
      2 : regFileWriteData = DataMemOut;

      // Default - Do Nothing
      default : begin
        regFileWriteData = 8'b0;
      end
    endcase
  end
endmodule

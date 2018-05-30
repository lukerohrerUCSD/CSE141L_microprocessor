/* Filename: Shift.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the logic for the shift module
*/

module Shift (
  input [7:0] Source,              // 8-bit input
  input Shift,                    // Control Signal to shift or not
  input [2:0] Shamt,
  output logic [7:0] Result       // Output 
  );

  always_comb begin
      case(Shift)
          //do nothing if 0
          0 : begin
            Result = Source;
          end

          // shift if 1
          1 : begin
            Result = Source << 1;
          end
      endcase
  end
endmodule

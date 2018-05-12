/* Filename: Shift.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file contains the logic for the shift module
*/

module Shift (
  input [7:0] source,              // 8-bit input
  input shift,                    // Control Signal to shift or not
  output logic [7:0] result       // Output 
  );

  always_comb begin
      case(shift)
          //do nothing if 0
          0 : begin
            result = source;
          end

          // shift if 1
          1 : begin
            result = source << 1;
          end
      endcase
  end
endmodule

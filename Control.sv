/* Filename: Control.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the control module
*/

import definitions::*;

module Control (
  input [2:0] Opcode,               // 3 bits inputs for Opcode
  
  output logic branch               // 1 bit control for branch
  output logic load                 // 1 bit control for loading from memory
  output logic shift                // 1 bit control for shifting 
  output logic MemR                 // 1 bit control for memory read
  output logic copy                 // 1 bit control for copying
  output logic ALUOp [1:0]          // 2 bit control for ALU Operation
  output logic RegW                 // 1 bit control for register write

);

  always_comb begin
      case(Opcode)
          //store byte (sb)
          0 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 0;
          end
          
          //load byte (lb)
          1 : begin
            branch = 0;
            load = 1;
            shift = 0;
            MemR = 1;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //add (add)
          2 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 1;
            RegW = 1;
          end

          //and (and)
          3 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //xor (xor)
          4 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 2;
            RegW = 1;
          end

          //copy (cpy)
          5 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 1;
            ALUOp = 0;
            RegW = 1;
          end

          //shift logical (sl)
          6 : begin
            branch = 0;
            load = 0;
            shift = 1;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //branch not equal (bne)
          7 : begin
            branch = 1;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 3;
            RegW = 0;
          end
      endcase
  end
endmodule


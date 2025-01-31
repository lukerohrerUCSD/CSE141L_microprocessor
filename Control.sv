/* Filename: Control.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the control module
*/


module Control (
  input [2:0] Opcode,               // 3 bits inputs for Opcode
  
  output logic Branch,               // 1 bit control for branch
  output logic Load,                 // 1 bit control for loading from memory
  output logic Shift,                // 1 bit control for shifting 
  output logic ReadMem,                 // 1 bit control for memory read
  output logic WriteMem,		// 1 bit control for memory write
  output logic Copy,                 // 1 bit control for copying
  output logic [1:0] ALUOp,          // 2 bit control for ALU Operation
  output logic WriteReg                 // 1 bit control for register write

);

  always_comb begin
      case(Opcode)
          //store byte (sb)
          3'b000 : begin
            Branch = 0;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
	    WriteMem = 1;
            Copy = 0;
            ALUOp = 00;
            WriteReg = 0;
          end
          
          //load byte (lb)
          3'b001 : begin
            Branch = 0;
            Load = 1;
            Shift = 0;
            ReadMem = 1;
	    WriteMem = 0;
            Copy = 0;
            ALUOp = 00;
            WriteReg = 1;
          end

          //add (add)
          3'b010 : begin
            Branch = 0;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
	    WriteMem = 0;
            Copy = 0;
            ALUOp = 01;
            WriteReg = 1;
          end

          //and (and)
          3'b011 : begin
            Branch = 0;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
	    WriteMem = 0;
            Copy = 0;
            ALUOp = 00;
            WriteReg = 1;
          end

          //xor (xor)
          3'b100 : begin
            Branch = 0;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
            WriteMem = 0;
	    Copy = 0;
            ALUOp = 10;
            WriteReg = 1;
          end

          //copy (cpy)
          3'b101 : begin
            Branch = 0;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
	    WriteMem = 0;
            Copy = 1;
            ALUOp = 01;
            WriteReg = 1;
          end

          //shift logical (sl)
          3'b110 : begin
            Branch = 0;
            Load = 0;
            Shift = 1;
            ReadMem = 0;
	    WriteMem = 0;
            Copy = 0;
            ALUOp = 00;
            WriteReg = 1;
          end

          //branch not equal (bne)
          3'b111 : begin
            Branch = 1;
            Load = 0;
            Shift = 0;
            ReadMem = 0;
	    WriteMem = 0;
            Copy = 0;
            ALUOp = 11;
            WriteReg = 0;
          end
      endcase
  end
endmodule


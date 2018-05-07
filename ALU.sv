/* Filename: ALU.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file is for the ALU Module
*/

import definitions::*;
module ALU(
  input [3:0] ALUOp,            // 4 bits input for ALUOp
  input [7:0] ALUSrcA,          // 8 bits data input for ALUSrcA
  input [7:0] ALUSrcB,          // 8 bits data input for ALUSrcB
  input [7:0] ALUSrcC,          // 8 bits data input for ALUSrcC

  output logic OvOutALU,        // 1 bit Overflow/CarryOut data outut
  output logic [7:0] Result     // 8 bits Result from ALU data output
);

  ALUOp_mne op_name;            // ALU Operation Menmonic

  logic [8:0] tempResult;       // 9 bit Temp Result (used to capture overflow)

  always_comb begin
    case(ALUOp)
      // ALU Add Operation (unsigned)
      kADD : begin
        tempResult = ALUSrcA + ALUSrcB;
        Result = tempResult[7:0];
        if (tempResult[8] == 1) begin
          OvOutALU = 1;
        end else
          OvOutALU = 0;
      end

      // ALU Subtraction Operation (signed)
      kSUB : begin
        tempResult = $signed(ALUSrcA) - $signed(ALUSrcB);
        Result = tempResult[7:0];
        if ($signed(tempResult) < -128 || $signed(tempResult) > 127) begin
          OvOutALU = 1;
        end else
          OvOutALU = 0;
      end

      // ALU Bitwise And Operation
      kAND : begin
        Result = ALUSrcA & ALUSrcB;
        OvOutALU = 0;
				tempResult = 0;
      end

      // ALU Bitwise Or Operation
      kOR : begin
        Result = ALUSrcA | ALUSrcB;
        OvOutALU = 0;
				tempResult = 0;
      end

      // ALU Shift left Logical Operation
      kSLL : begin
        OvOutALU = ALUSrcA[7];
        tempResult = ALUSrcA << 1;
        Result = tempResult[7:0];
      end

      // ALU Shift Right Logical Operation
      kSRL : begin
        OvOutALU = ALUSrcA[0];
        Result = ALUSrcA >> 1;
	      tempResult = 0;
      end

      // ALU Set Less Than Operation (signed)
      kSLT : begin
        //OvOutALU = (ALUSrcA < ALUSrcB) ? 1'b1 : 1'b0;
				OvOutALU = ($signed(ALUSrcA) < $signed(ALUSrcB)) ? 1'b1 : 1'b0;
				tempResult = 0;
				Result = 0;
		  end

      // ALU Set Less Than Operation (unsigned)
      kSLTU : begin
        OvOutALU = (ALUSrcA < ALUSrcC) ? 1'b1 : 1'b0;
        tempResult = 0;
        Result = 0;
      end

      // ALU Two's Complement Operation
      kTWCMP : begin
        tempResult = ALUSrcA * -9'd1;
        Result = tempResult[7:0];
        OvOutALU = 0;
      end

      // ALU Absolute Value Operation (signed)
      kABS : begin
        tempResult = ($signed(ALUSrcA) < 0) ? ($signed(ALUSrcA) * -8'd1) : ALUSrcA;
        Result = tempResult[7:0];
        OvOutALU = 0;
      end

      // ALU Do Nothing Operation (Rest)
      default: begin
        tempResult = 0;
        OvOutALU = 0;
				Result = 0;
      end
  endcase

  // Assign Mnemonic depending on current ALUOp
  op_name = ALUOp_mne'(ALUOp);

  end

endmodule

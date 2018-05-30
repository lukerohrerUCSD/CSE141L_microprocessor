/* Filename: ALU.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: ALU Module
*/

module ALU(
  input [1:0] ALUOp,            // 4 bits input for ALUOp
  input [7:0] ALUSrcA,          // 8 bits data input for ALUSrcA
  input [7:0] ALUSrcB,          // 8 bits data input for ALUSrcB
//  input [7:0] ALUSrcC,          // 8 bits data input for ALUSrcC

//  output logic OvOutALU,        // 1 bit Overflow/CarryOut data outut
  output logic [7:0] Result,     // 8 bits Result from ALU data output
  output logic Zero	// 1 bit output 
);

//  ALUOp_mne op_name;            // ALU Operation Menmonic

  logic [8:0] tempResult;       // 9 bit Temp Result (used to capture overflow)

  always_comb begin
      case(ALUOp)
          //Bitwise And Operation
          0 : begin
            Result = ALUSrcA & ALUSrcB;
          end

          //Add Operation (unsigned)
          1 : begin
            Result = ALUSrcA + ALUSrcB;
          end

          //XOR Operation
          2 : begin
            Result = ALUSrcA ^ ALUSrcB;
          end

          //Subtraction Operation (unsigned)
          3 : begin
            Result = ALUSrcA - ALUSrcB;
          end
      endcase
  end

endmodule


/*  always_comb begin
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
*/

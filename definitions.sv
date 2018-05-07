/* Filename: definitions.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file defines the operations used in the ALU
*/

package definitions;

	// Instruction map
  const logic [3:0] kADD = 4'd0;
  const logic [3:0] kSUB = 4'd1;
  const logic [3:0] kAND = 4'd2;
  const logic [3:0] kOR = 4'd3;
  const logic [3:0] kSLL = 4'd4;
	const logic [3:0] kSRL = 4'd5;
	const logic [3:0] kSLT = 4'd6;
	const logic [3:0] kTWCMP = 4'd7;
	const logic [3:0] kABS = 4'd8;
  const logic [3:0] kSLTU = 4'd9;
  const logic [3:0] kREST = 4'd10;

  // ALU Operation Mnemonics
  typedef enum logic[3:0] {
    ADD = 4'd0,
    SUB = 4'd1,
    AND = 4'd2,
    OR = 4'd3,
		SLL = 4'd4,
		SRL = 4'd5,
		SLT = 4'd6,
		TWCMP = 4'd7,
		ABS = 4'd8,
    SLTU = 4'd9,
    REST = 4'd10
  } ALUOp_mne;

  // Pattern Check Bit Position Menmonics
  typedef enum logic [2:0] {
    ONE = 3'd1,
    TWO = 3'd2,
    THREE = 3'd3,
    FOUR = 3'd4,
    FIVE = 3'd5
  } BitPosition_mne;

endpackage

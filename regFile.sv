/* Filename: regFile.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file defines the register file module
*/

module regFile #(parameter W=8, D=3)(
  input CLK,
	input WriteReg,
  input [D-1:0] Reg1,
  input [D-1:0] Reg2,
  input [D-1:0] WReg,
  input [W-1:0] WriteValue,

  output logic [W-1:0] ReadReg1,
  output logic [W-1:0] ReadReg2,
	output logic [W-1:0] ReadR0,
  output logic [W-1:0] ReadR1,
  output logic [W-1:0] ReadR6
);

	// 8 bits wide [7:0] and 3 registers deep [0:7] or just [8]
	logic [W-1:0] registers[2**D];

  initial begin

    // For Program19
    // uncomment below line when we have machine code ready
    //$readmemb("ENCODE.txt", registers);
  end

	// Combinational reads
	always_comb ReadReg1 = registers[Reg1];
	always_comb ReadReg2 = registers[Reg2];
	always_comb ReadR0 = registers[3'b000];
  always_comb ReadR1 = registers[3'b001];
  always_comb ReadR6 = registers[3'b110];

	// sequential (clocked) writes
	always_ff @ (posedge CLK)

    // Normal write to register operation
		if (WriteReg)
			registers[WReg] <= WriteValue;

endmodule

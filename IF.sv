/* Filename: IF.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file handles the next instruction logic
*/

module IF(
	input CLK,											// Clock input
	input Start,										// Start control signal to b
	input Halt,											// Halt control signal input
	input Branch,										// Branch control signal (non-conditional)
	input BranchCond,								// Conditional Branch control signal
	input signed[7:0] Offset,				// 8 bit signed value offset for branch distance
	input logic[7:0] Start_Addr,		// 8 bit value representing instruction start address

	output logic [7:0] PC						// 8 bit data output value for program counter
  );

	// Sequentially (clocked) write of PC
	always_ff @(posedge CLK)
		// If Start asserted, then set PC to Start Address
		if (Start)
			PC <= Start_Addr;
		// If Halt asserted, then PC remains unchanged
		else if (Halt)
			PC <= PC;
		// If Branch or BranchCond asserted then add signed Offset to PC
		else if (Branch || BranchCond)
			PC <= PC + Offset;
		// Otherwise increment PC by 1
		else
			PC <= PC + 8'd1;

endmodule

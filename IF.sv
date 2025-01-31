/* Filename: IF.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file handles the next instruction logic
*/

module IF(
	input CLK,											// Clock input
	input Start,										// Start control signal to b
	input logic[7:0] Start_Addr,		// 8 bit value representing instruction start address
	input Branch,										// Branch control signal (non-conditional)
	input Zero, 										// Zero input
	input [5:0] Offset, 									// Shift offset

	output logic [7:0] PC						// 8 bit data output value for program counter
  );

	// Sequentially (clocked) write of PC
	always_ff @(posedge CLK)
		// If Start asserted, then set PC to Start Address
		if (Start) 
			begin
			//$display("setting PC = %d to 0", PC);
			PC <= Start_Addr;
			end		
		// If Branch asserted then add signed Offset to PC
		else if (Branch && !Zero && PC[7:0] != 8'b01001011) 
			begin
			//$display("doing a branch (space characters)");
			//$display("PC before = %d, offset = $b", PC, Offset);
			PC <= ((PC >> 6) << 6) + Offset;
			//PC <= PC + Offset;
			end		
		else if (Branch && !Zero && PC[7:0] == 8'b01001011)
			begin
			//$display("doing a branch (message characters)");
			//$display("PC before = %d, offset = $b", PC, Offset);
			PC <= ((PC >> 7) << 7) + Offset;
			//PC <= PC + Offset;
			end
		// Otherwise increment PC by 1
		else
			PC <= PC + 8'd1;

endmodule

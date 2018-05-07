/* Filename: regFile.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file defines the register file module
*/

module regFile #(parameter W=8, D=3)(
  input CLK,                         // Clock Input
	input RegWrite,                    // Control signal to allow write to register
	input ClearReg,                    // Control signal to idicate clear register
	input IncReg,                      // Control signal to indicate increment register
	input OvToReg,                     // Control signal to indicate get/set overflow to register
  input LoadImm,                     // Control signal to indicate load immedaite
  input [D-1:0] srcA,                // 3 bits source register address input (R[rs])
  input [D-1:0] srcB,                // 3 bits target register address input (R[rt])
  input [D-1:0] writeReg,            // 3 bits destination register address input (alwasys R[rs])
  input [W-1:0] writeValue,          // 8 bits write data input
	input ovValue,                     // 1 bit overflow data input to write (for getov)

  output logic [W-1:0] ReadA,        // 8 bits source register data ($rs)
  output logic [W-1:0] ReadB,        // 8 bits target register data ($rt)
	output logic [W-1:0] ReadR0,       // 8 bits $r0 register data
  output logic [W-1:0] ReadR6        // 8 bits $r6 register data
);

	// 8 bits wide [7:0] and 3 registers deep [0:7] or just [8]
	logic [W-1:0] registers[2**D];

  initial begin
    //$readmemb("reg_init.txt", registers);
    // For Program19
    $readmemb("reg_init_p19.txt", registers);
  end

	// Combinational reads
	always_comb ReadA = registers[srcA];
	always_comb ReadB = registers[srcB];
	always_comb ReadR0 = registers[3'b000];
  always_comb ReadR6 = registers[3'b110];

	// sequential (clocked) writes
	always_ff @ (posedge CLK)
    // Normal write to register operation
		if (RegWrite && !ClearReg && !IncReg && !OvToReg && !LoadImm)
			registers[writeReg] <= writeValue;

    // Load immediate always writes to R[r0]
    else if (RegWrite && !ClearReg && !IncReg && !OvToReg && LoadImm)
      registers[0] <= writeValue;

    // Clear register operation
		else if (RegWrite && ClearReg && !IncReg && !OvToReg && !LoadImm)
			registers[writeReg] <= 8'd0;

    // Increment register operation
		else if (RegWrite && IncReg && !ClearReg && !OvToReg && !LoadImm)
			registers[writeReg] <= registers[writeReg] + 8'd1;

    // getov operation (Write overflow input to MSB of write register)
		else if (RegWrite && OvToReg && !ClearReg && !IncReg)
			registers[writeReg] <= {{ovValue}, {registers[writeReg][6:0]}};

endmodule

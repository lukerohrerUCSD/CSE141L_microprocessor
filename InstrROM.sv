/* Filename: InstrRom.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/15/16
 * Description: This file handles the Instruction ROM
*/

module InstrROM (
  input [7:0] InstrAddress,       // Instruction Address to fetch from (PC)
  output logic [8:0] InstrOut     // 9-bits Instruction Output
  );

  // Instruction ROM 9 bits wide by 256 deep
	logic [8:0] instr_memory [0:255];

  // Load up Instruction ROM with Machine Code produced from Beeth9Asm
  initial begin
    $readmemb("Beeth9MachineCode.txt", instr_memory);
  end

  // Combinational read output for instruction
  always_comb begin
    InstrOut = instr_memory[InstrAddress];
  end
endmodule

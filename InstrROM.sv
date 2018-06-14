/* Filename: InstrRom.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
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
    $readmemb("encodeMachine.txt", instr_memory);
    $display("LOADED INSTRUCTIONS");
	
    //IF WE WANT TO DO DECRYPT, LOAD ALL INSTRUCTION AT START (concat all .txt files into one, read that in)

  end

  // Combinational read output for instruction
  always_comb begin
    InstrOut = instr_memory[InstrAddress];
  end
endmodule

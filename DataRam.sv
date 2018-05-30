/* Filename: DataRam.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the Data RAM Memory
*/

module DataRAM (DataSrcA, DataSrcB, DataMemOut, MemRead, MemWrite, CLK);
  input CLK;                        // Clock Input
  input MemRead;                    // Control signal to allow read from memory
  input MemWrite;                   // Control signal to allow write to memory
	input [7:0] DataSrcA;             // 8 bits memory address to read from, also 8 bit data to write to memory
  input [7:0] DataSrcB;             // 8 bits memory address to write to in memory

  output logic [7:0] DataMemOut;    // 8 bits data output read from memory

  // Data Memory: 8 bits wide by 256 deep
	logic [7:0] my_memory [0:255];

  // Load up the rama from ram_init text file
  initial begin
    //$readmemb("ram_init.txt", my_memory);
    // For Program19 test case of evenly spaced out
    $readmemb("ram_init_p19.txt", my_memory);
  end

  // Check MemReadm, if asserted then read out data from memory
  always_comb
    if(MemRead) begin
      DataMemOut = my_memory[DataSrcA];
		end else
      DataMemOut = 8'b0;

  // If MemWrite and posedge CLK, then write data to memory
  always @ (posedge CLK)
    if(MemWrite) begin
      my_memory[DataSrcB] = DataSrcA;
    end

endmodule

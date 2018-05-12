/* Filename: DataRam_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the test bench for the DataRam file module
 */

module DataRam_tb;
  
  // DUT Input Drivers
  bit CLK;
  bit MemRead;
  bit MemWrite;
  
  bit [7:0] DataSrcA;
  bit [7:0] DataSrcB;

  // DUT Output Drivers
  bit [7:0] DataMemOut;

  // Instantiate UUT (unit under test)
  DataRam uut(.*);

  initial begin

    // Initialize Data Memory with data from text file
    $readmemb("ram_init.txt", uut.data_memory);
	  $display("DataRam data memory");
	  for (i = 0; i < 10; i = i + 1)
		  $display("%d:%b", i, uut.data_memory[i]);

    // Wait 100ns for global reset to finish
    #100ns;

    // Check if reading from DataRam works, getting the value store at A(1)
    MemRead = 1;
    MemWrite = 0;
    DataSrcA = 8'b00000001
    #20ns;

    // Check if writing to DataRam works, writting value A(1) to address B(3)
    MemRead = 0;
    MemWrite = 1;
    DataSrcA = 8'b00000001
    DataSrcB = 8'b00000011
    #20ns;

    // End the Test
    #20ns $stop;

  end

  always begin
    // Alternate clock for period of 20ns
   	#10ns CLK = 1;
   	#10ns CLK = 0;
  end

endmodule

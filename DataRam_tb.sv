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
  
  bit [7:0] DataSrc;
  bit [7:0] Address;

  // DUT Output Drivers
  wire [7:0] DataMemOut;

  // Instantiate UUT (unit under test)
  DataRAM uut(.*);

  initial begin

    // Initialize Data Memory with data from text file
    $readmemb("ram_init.txt", uut.my_memory);
	  $display("DataRam data memory");
	  for (int i = 0; i < 255; i = i + 1)
		  $display("%d:%b", i, uut.my_memory[i]);

/*
    // Wait 100ns for global reset to finish
    #100ns;

    // Check if reading from DataRam works, getting the value store at A(1)
    MemRead = 1;
    MemWrite = 0;
    DataSrcA = 8'b00000001;
    #20ns;

    // Check if writing to DataRam works, writting value A(1) to address B(3)
    MemRead = 0;
    MemWrite = 1;
    DataSrcA = 8'b00000001;
    DataSrcB = 8'b00000011;
    #20ns;
*/
    // End the Test
    #20ns $stop;

  end

  always begin
    // Alternate clock for period of 20ns
   	#10ns CLK = 1;
   	#10ns CLK = 0;
  end

endmodule

/* Filename: IF_tb.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the testbench for IF module
*/

module IF_tb;

  // IF DUT Input Drivers
  bit CLK;
  bit Start;
  bit Branch;
  bit Zero;
  bit [5:0] Offset;
  bit [7:0] Start_Addr;

  // IF DUT Output Drivers
  bit [7:0] PC;

  // InstrRom DUT Input Drivers
  bit [7:0] InstrAddressConnector;

  // InstrRom DUT Output Drivers
  bit [8:0] InstrOut;

  // Instantiate IF Module UUT (Unit Under Test)
  IF IF_uut(
    .CLK(CLK),
    .Start(Start),
    .Start_Addr(Start_Addr),
    .Branch(Branch),
    .Zero(Zero),
    .Offset(Offset),
    .PC(InstrAddressConnector)
  );

  // Instantia InstrRom Module UUT (Unit Under Test)
  InstrROM InstrRom_uut(
    .InstrAddress(InstrAddressConnector),
    .InstrOut(InstrOut)
  );

  integer i;

  initial begin
    // Check and see if Beeth9MachinCode.txt was read correctly
	  $display("Instruction Data");
	  for (i = 0; i < 256; i = i + 1)
		  $display("%d:%b  %h", i, InstrRom_uut.instr_memory[i], InstrRom_uut.instr_memory[i]);

    // Wait 100 ns for global reset to finish
    #100ns;

    // // Assert Start and set Start_Addr to 0
    // Start = 1;
    // Halt = 0;
    // Branch = 0;
    // BranchCond = 0;
    // //Start_Addr = 8'd0;
    // #20ns;
    //
    // // Check that PC is incrementing by 1
    // Start = 0;
    // Halt = 0;
    // Branch = 0;
    // BranchCond = 0;
    // #20ns;
    //
    // // Check that PC is Branching (non-conditional) forward correctly
    // Start = 0;
    // Halt = 0;
    // Branch = 1;
    // BranchCond = 0;
    // Offset = 8'd4;
    // #20ns;
    //
    // // Check that PC is Branching (non-conditional) backward correctly
    // Start = 0;
    // Halt = 0;
    // Branch = 1;
    // BranchCond = 0;
    // Offset = -8'd5;
    // #20ns;
    //
    // // Check that PC is Branching (conditional) forward correctly
    // Start = 0;
    // Halt = 0;
    // Branch = 0;
    // BranchCond = 1;
    // Offset = 8'd5;
    // #20ns;
    //
    // // Check that PC is Branching (non-conditional) backward correctly
    // Start = 0;
    // Halt = 0;
    // Branch = 0;
    // BranchCond = 1;
    // Offset = -8'd5;
    // #20ns;
    //
    // // Check that PC is  NOT Branching when Branch and BranchCond signals are
    // // deasserted. PC should just be incremented by 1.
    // Start = 0;
    // Halt = 0;
    // Branch = 0;
    // BranchCond = 0;
    // Offset = 8'd5;
    // #20ns;
    //
    // // Check that Halt is working; PC should be same as prev clock cycle
    // Start = 0;
    // Halt = 1;
    // Branch = 0;
    // BranchCond = 0;
    // Offset = 8'd0;
    // #20ns;

    //Start = 1;
    //Start_Addr = 8'd10;
    //Halt = 0;
    //Branch = 0;
    //BranchCond = 1;
    //Offset = 0;
    //#20ns;

    //Start = 0;
    //Start_Addr = 8'd0;
    //Halt = 0;
    //Branch = 0;
    //BranchCond = 1;
    //Offset = 8'd15;
    //#20ns;


    // End testbench here
    #20ns $stop;
  end

  always begin
    // Alternate clock for 20ns period
   	#10ns CLK = 1;
   	#10ns CLK = 0;
  end

endmodule

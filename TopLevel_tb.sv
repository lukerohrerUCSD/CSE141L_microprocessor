/* Filename: TopLevel.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/15/16
 * Description: This file defines the testbench for the TopLevel module
*/

module TopLevel_tb;

  // DUT Input Drivers
  bit CLK;
  bit start;
  bit [7:0] start_addr;

  // DUT Output Drivers
  wire halt;
  wire done;

  // Instantiate the Unit Under Test  (UUT)
  TopLevel uut(.*);

  initial begin
    // Initialize Inputs

    // Wait 100ns for global reset to finish
    #100ns;
    start = 1;


    // For testing Program17.s
    //start_addr = 8'd0;

    // For testing Program18.s
    //start_addr = 8'd75;

    // For testing Program19.s
    start_addr = 8'd000;

    #10ns;
    start = 0;

    //#200000ns;

    wait(done);

    // For testing Program17.s
    //$display("DataMem Location 4: %h", uut.DataRAM_module.my_memory[4]);
    //$display("DataMem Location 5: %h", uut.DataRAM_module.my_memory[5]);

    // For testing Program18.s
    //$display("DataMem Location 7: %h", uut.DataRAM_module.my_memory[7]);

    // For testing Program19.s
    //$display("DataMem Location 127: %h", uut.DataRAM_module.my_memory[127]);

    // Display InstrCount
    $display("Dynamic Instruction Count: %d", uut.InstrCount);

    $stop;
  end

  always begin
    // Alternate clock for 10ns period
    #5ns  CLK = 1;
    #5ns  CLK = 0 ;
  end
endmodule

/* Filename: Control_tb.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/17/16
 * Description: This file defines the testbench for Control(ID) module
*/

module Control_tb;

  // DUT Input Drivers
  bit CLK;
  bit [2:0] Opcode;
  bit [2:0] Funct;

  // DUT Output Drivers
  bit [3:0] ALUOp;
  bit RegWrite;
  bit ClearReg;
  bit IncReg;
  bit OvToReg;
  bit LoadImm;         
  bit [1:0] WriteValSel;
  bit MemRead;
  bit MemWrite;
  bit [1:0] OvSel;
  bit OvWrite;
  bit Branch;
  bit BranchCond;
  bit Halt;

  // Instantiate UUT (Unit Under Test)
  Control uut(.*);

initial begin

    // Wait 100 ns for global reset to finish
    #100ns;

    //Check if the decode for li is correct
    Opcode = 3'b000;
    #20ns;

    //Check if the decode for clr is correct
    Opcode = 3'b001;
    Funct = 3'b000;
    #20ns;

    //Check if the decode for inc is correct
    Opcode = 3'b001;
    Funct = 3'b001;
    #20ns;

    //Check if the decode for sll is correct
    Opcode = 3'b001;
    Funct = 3'b010;
    #20ns;

    //Check if the decode for srl is correct
    Opcode = 3'b001;
    Funct = 3'b011;
    #20ns;

    //Check if the decode for twcmp is correct
    Opcode = 3'b001;
    Funct = 3'b100;
    #20ns;

    //Check if the decode for halt is correct
    Opcode = 3'b001;
    Funct = 3'b101;
    #20ns;

    //Check if the decode for lw is correct
    Opcode = 3'b001;
    Funct = 3'b110;
    #20ns;

    //Check if the decode for sw is correct
    Opcode = 3'b001;
    Funct = 3'b111;
    #20ns;

    //Check if the decode for br is correct
    Opcode = 3'b010;
    Funct = 3'b000;
    #20ns;

    //Check if the decode for bez is correct
    Opcode = 3'b010;
    Funct = 3'b001;
    #20ns;

    //Check if the decode for clsb is correct
    Opcode = 3'b010;
    Funct = 3'b010;
    #20ns;

    //Check if the decode for getov is correct
    Opcode = 3'b010;
    Funct = 3'b011;
    #20ns;

    //Check if the decode for patr is correct
    Opcode = 3'b010;
    Funct = 3'b100;
    #20ns;

    //Check if the decode for abs is correct
    Opcode = 3'b010;
    Funct = 3'b101;
    #20ns;

    //Check if the decode for add is correct
    Opcode = 3'b011;
    #20ns;

    //Check if the decode for sub is correct
    Opcode = 3'b100;
    #20ns;

    //Check if the decode for and is correct
    Opcode = 3'b101;
    #20ns;

    //Check if the decode for or is correct
    Opcode = 3'b110;
    #20ns;

    //Check if the decode for slt is correct
    Opcode = 3'b111;
    #20ns;

    // End testbench here
    #20ns $stop;
  end

  always begin
    // Alternate clock for 20ns period
   	#10ns CLK = 1;
   	#10ns CLK = 0;
  end

endmodule

/* Filename: regFile_tb.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 10/26/16
 * Description: This file defines the testbench for register file module
*/

module regFile_tb;
	// Paramters to pass to RegFile Module
	parameter DT = 3;
	parameter WT = 8;

	// DUT input drivers
	bit CLK;
	bit RegWrite;
	bit ClearReg;
	bit IncReg;
	bit OvToReg;
	bit [DT-1:0] srcA;
	bit [DT-1:0] srcB;
	bit [DT-1:0] writeReg;
	bit [WT-1:0] writeValue;
	bit ovValue;

	// DUT output drivers
	wire [WT-1:0] ReadA;
	wire [WT-1:0] ReadB;
	wire [WT-1:0] ReadR0;

	// Instantiate UUT (Unit Under Test)
	regFile #(.W(WT), .D(DT)) uut(.*);

	initial begin
	// Wait 100ns for global reset to finish
	#100ns;

	// Set srcA and srcB
	srcA = 3'b001;
	srcB = 3'b010;

	// Write some random data to $r2, to check ReadB
	uut.registers[2] = 8'hDD;

	// Check if writing to register works
	writeReg = 3'b001;
	writeValue = 8'hFE;
	ovValue = 0;
	RegWrite = 1;
	ClearReg = 0;
	IncReg = 0;
	OvToReg = 0;
	#20ns;

	// Check if writing without RegWrite has no impact
	writeReg = 3'b001;
	writeValue = 8'hAA;
	ovValue = 0;
	RegWrite = 0;
	ClearReg = 0;
	IncReg = 0;
	OvToReg = 0;
	#20ns;

	// Check if increment register works
	IncReg = 1;
	writeReg = 3'b001;
	RegWrite = 1;
	ClearReg = 0;
	IncReg = 1;
	OvToReg = 0;
	#20ns

	// Check if clear register works
	writeReg = 3'b001;
	RegWrite = 1;
	ClearReg = 1;
	IncReg = 0;
	OvToReg = 0;
	#20ns;

	// Check if getOv functionality works
	writeReg = 3'b001;
	ovValue = 1;
	RegWrite = 1;
	ClearReg = 0;
	IncReg = 0;
	OvToReg = 1;
	#20ns;

	// Write to R0, and see if ReadR0 is working
	writeReg = 3'b000;
	writeValue = 8'hCC;
	ovValue = 0;
	RegWrite = 1;
	ClearReg = 0;
	IncReg = 0;
	OvToReg = 0;

	// End the testbench here
	#20ns $stop;
	end

	always begin
		// Alternate clock for period of 20ns
		#10ns CLK = 1;
		#10ns CLK = 0;
	end

endmodule

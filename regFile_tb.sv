/* Filename: regFile_tb.sv
  * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/9/18
 * Description: This file defines the testbench for register file module
*/

module regFile_tb;
	// Paramters to pass to RegFile Module
	parameter DT = 3;
	parameter WT = 8;

	// DUT input drivers
	bit CLK;
	bit WriteReg;
	bit [DT-1:0] Reg1;
	bit [DT-1:0] Reg2;
	bit [DT-1:0] WReg;
	bit [WT-1:0] WriteValue;

	// DUT output drivers
	wire [WT-1:0] ReadReg1;
	wire [WT-1:0] ReadReg2;
	wire [WT-1:0] ReadR0;
	wire [WT-1:0] ReadR1;
	wire [WT-1:0] ReadR6;

	// Instantiate UUT (Unit Under Test)
	regFile #(.W(WT), .D(DT)) uut(.*);

	initial begin
	// Wait 100ns for global reset to finish
	#100ns;

	// Set Reg1 and Reg2
	Reg1 = 3'b001;
	Reg2 = 3'b010;

	// Check if writing to register works
	WReg = 3'b001;
	WriteValue = 8'hFE;
	WriteReg = 1;
	#20ns;

	// Check if writing without RegWrite has no impact
	WReg = 3'b001;
	WriteValue = 8'hAA;
	WriteReg = 0;
	#20ns;


	// Write to R0, and see if ReadR0 is working
/*`	writeReg = 3'b000;
	writeValue = 8'hCC;
	ovValue = 0;
	RegWrite = 1;
	ClearReg = 0;
	IncReg = 0;
	OvToReg = 0;
*/
	// End the testbench here
	#20ns $stop;
	end

	always begin
		// Alternate clock for period of 20ns
		#10ns CLK = 1;
		#10ns CLK = 0;
	end

endmodule

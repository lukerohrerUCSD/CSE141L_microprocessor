/* Filename: TopLevel.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/9/18
 * Description: This file contains the the TopLevel for PIMP Implementation
*/

module TopLevel(
  input start,
  input [7:0] start_addr,
  input CLK,
  output logic done);

  // Insruction Fetch Output wires
  wire [7:0] PC;

  // Instruction Memory Output wires
  wire [8:0] InstrOut;
  //wire [5:0] brAddr;
  //wire [2:0] opcode;
  //wire [2:0] reg1Addr;
  //wire [2:0] reg2Addr;

  // Control Signal Output wires
  wire branch;
  wire load;
  wire shift;
  wire copy;
  wire readMem;
  wire writeMem;
  wire writeReg;
  wire[1:0] ALUOp;

  // Register File Input & Output Wires
  //wire [2:0] reg1;      //in
  //wire [2:0] reg2;      //in
  //wire [2:0] regW;      //in
  //wire [7:0] writeData; //in
  wire [7:0] readReg1;
  wire [7:0] readReg2;
  wire [7:0] readR0;    //register 0
  wire [7:0] readR1;    //register 1
  wire [7:0] readR6;    //register 6

  // ALU Output wires
  wire [7:0] ALUOut;
  wire zero;

  // Data Memory Output wires
  wire [7:0] DataMemOut;

  // Shift Output wires
  wire [7:0] shiftOut;

  // BranchMux1 Output wire
  wire [7:0] brMux1Data;

  // BranchMux2 Output wire
  wire [7:0] brMux2Data;

  // CpyMux Output wire
  wire [7:0] cpyMuxData;

  // ShiftALUMux Output wire
  wire [7:0] shiftALUMuxData;

  // WriteMux Ouput wire
  wire [7:0] writeMuxData;

  // Instruction Counter
  logic [15:0] InstrCount;

  // IF Module Instance
  IF IF_module (
    .CLK(CLK),
    .Start(start),
    .Start_Addr(start_addr),
    .Branch(branch),
    .Zero(zero),
    .Offset(InstrOut[5:0]),
    .PC(PC)
  );
  // InstrRom Module Instance
  InstrROM InstrROM_module (
    .InstrAddress(PC),
    .InstrOut(InstrOut)
  );

  // Control Module Instance
  Control Control_module(
    .Opcode(InstrOut[8:6]),
    .ALUOp(ALUOp),
    .Branch(branch),
    .Load(load),
    .Shift(shift),
    .Copy(copy),
    .ReadMem(readMem),
    .WriteMem(writeMem),
    .WriteReg(writeReg)
  );

  // Register File Module Instance
  regFile regFile_module(
    .CLK(CLK),
    .WriteReg(writeReg),
    .Reg1(InstrOut[5:3]),
    .Reg2(InstrOut[2:0]),
    .WReg(InstrOut[5:3]),
    .WriteValue(writeMuxData),
    .ReadReg1(readReg1),
    .ReadReg2(readReg2),
    .ReadR0(readR0),
    .ReadR1(readR1),
    .ReadR6(readR6)
  );

  // BranchMux1 Module Instance
  BranchMux1 BranchMux1_module (
    .Source1(readR0),
    .Source2(readReg1),
    .Branch(branch),
    .BrMux1(brMux1Data)
  );

  // BranchMux2 Module Instance
  BranchMux2 BranchMux2_module (
    .Source1(readR1),
    .Source2(readReg2),
    .Branch(branch),
    .BrMux2(brMux2Data)
  );

  // CopyMux Module Instance
  CopyMux CopyMux_module (
    .Source1(brMux2Data),
    .Source2(8'b00000000),
    .Copy(copy),
    .CpyMux(cpyMuxData)
  );

  // ALU Module Instance
  ALU ALU_module (
    .ALUOp(ALUOp),
    .ALUSrcA(brMux1Data),
    .ALUSrcB(cpyMuxData),
    .Result(ALUOut),
    .Zero(zero)
  );

  // Data Memory Module Instance
  DataRAM DataRAM_module(
    .CLK(CLK),
    .MemRead(readMem),
    .MemWrite(writeMem),
    .DataSrc(readReg1),
    .DataMemOut(DataMemOut),
    .Address(readR6)
  );

  // Shift Module Instance
  Shift Shift_module(
    .Shift(shift),
    .Result(shiftOut),
    .Source(readReg1),
    .Shamt(InstrOut[2:0])
  );

  // ShiftALUMux Module Instance
  ShiftALUMux ShiftALUMux_module(
    .Source1(shiftOut),
    .Source2(ALUOut),
    .Shift(shift),
    .SAMux(shiftALUMuxData)
  );

  // WriteMux Module Instance
  WriteMux WriteMux_module(
    .Source1(shiftALUMuxData),
    .Source2(DataMemOut),
    .Load(load),
    .WMux(writeMuxData)
  );

  always_comb 
    done = &PC[7:0];

  always_ff@(posedge CLK)
  if (start == 1)
      InstrCount <= 0;
  else 
      InstrCount <= InstrCount + 16'h01;
  


endmodule

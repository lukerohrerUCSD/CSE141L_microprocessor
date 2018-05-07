/* Filename: TopLevel.sv
 * Authors: Moiz Qureshi, Ye Huang, Eduardo Rosales
 * Date: 11/15/16
 * Description: This file contains the the TopLevel for Beeth9 Implementation
*/

module TopLevel(
  input start,
  input [7:0] start_addr,
  input CLK,
  output halt );

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
  wire [2:0] reg1;      //in
  wire [2:0] reg2;      //in
  wire [7:0] writeData; //in
  wire [7:0] readReg1;
  wire [7:0] readReg2;
  wire [7:0] readR0;    //register 0
  wire [7:0] readR1;    //register 1
  wire [7:0] readR6;    //register 6

  // ALU Output wires
  wire OvOutALU;
  wire [7:0] ALUOut;

  // Data Memory Output wires
  wire [7:0] DataMemOut;

  // Pattern Output Wire
  wire PatrOut;

  // Overflow Register Input & Output wire
  wire OvInputMuxData;
  wire ovOut;

  // Intruction Count Register
  logic [15:0] InstrCount;

  // IF Module Instance
  IF IF_module (
    .CLK(CLK),
    .Start(start),
    .Start_Addr(start_addr),
    .Halt(halt),
    .Branch(Branch),
    .BranchCond(BranchCond & !ovOut),
    .Offset(ReadR0),
    .PC(PC)
  );

  InstrROM InstrROM_module (
    .InstrAddress(PC),
    .InstrOut(InstrOut)
  );

  // Control Module Instance
  Control Control_module(
    .Opcode(InstrOut[8:6]),
    .Funct(InstrOut[2:0]),
    .ALUOp(ALUOp),
    .RegWrite(RegWrite),
    .ClearReg(ClearReg),
    .IncReg(IncReg),
    .OvToReg(OvToReg),
    .LoadImm(LoadImm),
    .WriteValSel(WriteValSel),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .OvSel(OvSel),
    .OvWrite(OvWrite),
    .Branch(Branch),
    .BranchCond(BranchCond),
    .Halt(halt)
  );

  // Register File Module Instance
  regFile regFile_module(
    .CLK(CLK),
    .RegWrite(RegWrite),
    .ClearReg(ClearReg),
    .IncReg(IncReg),
    .OvToReg(OvToReg),
    .LoadImm(LoadImm),
    .srcA(InstrOut[5:3]),
    .srcB(InstrOut[2:0]),
    .writeReg(InstrOut[5:3]),
    .writeValue(regFileWriteData),
    .ovValue(ovOut),
    .ReadA(ReadA),
    .ReadB(ReadB),
    .ReadR0(ReadR0),
    .ReadR6(ReadR6)
  );

  // ALU Module Instance
  ALU ALU_module (
    .ALUOp(ALUOp),
    .ALUSrcA(ReadA),
    .ALUSrcB(ReadB),
    .ALUSrcC(ReadR6),
    .Result(ALUOut),
    .OvOutALU(OvOutALU)
  );

  // Plumbing Module for Overflow Register Data Input
  OvInputMux OvInputMux_module (
    .OvSel(OvSel),
    .CLSBOv(ReadA[0]),
    .PatrOut(PatrOut),
    .OvOutALU(OvOutALU),
    .OvInputMuxData(OvInputMuxData)
  );

  // Overflow 1-Bit Register Module Instance
  OvReg OvReg_module(
    .CLK,
    .OvWrite(OvWrite),
    .dataIn(OvInputMuxData),
    .ovOut(ovOut)
  );

  // Patter Check Module Instance
  Patr Patr_module(
    .PatrSrcA(ReadA),
    .PatrSrcB(ReadR0),
    .PatrOut(PatrOut)
  );

  // Data Memory Module Instance
  DataRAM DataRAM_module(
    .CLK(CLK),
    .MemRead(MemRead),
    .MemWrite(MemWrite),
    .DataSrcA(ReadA),
    .DataSrcB(ReadR0),
    .DataMemOut(DataMemOut)
  );

  // Plumbing Module for Register File Write Data Input
  regFileWriteDataMux regFileWriteDataMux_module (
    .WriteValSel(WriteValSel),
    .Result(ALUOut),
    //.UImmediate({2'b00, InstrOut[5:0]}),
    .UImmediate({2'b00, InstrOut[5:0]}),
    .DataMemOut(DataMemOut),
    .regFileWriteData(regFileWriteData)
  );

  always@(posedge CLK)
  if (start == 1)
      InstrCount <= 0;
  else if(start == 0 && halt != 1)
    InstrCount <= InstrCount+16'd1;
  else
    InstrCount <= InstrCount;

endmodule

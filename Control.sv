/* Filename: Control.sv
 * Authors: Luke Rohrer, Max Zhao, Josh Robertson
 * Date: 5/11/18
 * Description: This file defines the control module
*/

import definitions::*;

module Control (
  input [2:0] Opcode,               // 3 bits inputs for Opcode
  
  output logic branch               // 1 bit control for branch
  output logic load                 // 1 bit control for loading from memory
  output logic shift                // 1 bit control for shifting 
  output logic MemR                 // 1 bit control for memory read
  output logic copy                 // 1 bit control for copying
  output logic ALUOp [1:0]          // 2 bit control for ALU Operation
  output logic RegW                 // 1 bit control for register write

/*  output logic [3:0] ALUOp,         // 4 bits control for ALU Operation
  output logic RegWrite,            // 1 bit control for register write
  output logic ClearReg,            // 1 bit control for register clear
  output logic IncReg,              // 1 bit control for register increment
  output logic OvToReg,             // 1 bit control for get overflow & set
  output logic LoadImm,             // 1 bit control signal fro laod immediate
  output logic [1:0] WriteValSel,   // 2 bits control for write value mux
  output logic MemRead,             // 1 bit control for memory read
  output logic MemWrite,            // 1 bit control for memory write
  output logic [1:0] OvSel,         // 2 bits control for overflow source mux
  output logic OvWrite,             // 1 bit control for overflow register write
  output logic Branch,              // 1 bit control for branch
  output logic BranchCond,          // 1 bit control for conditional branch
  output logic Halt                 // 1 bit control for halt */
);

  always_comb begin
      case(Opcode)
          //store byte (sb)
          0 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 0;
          end
          
          //load byte (lb)
          1 : begin
            branch = 0;
            load = 1;
            shift = 0;
            MemR = 1;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //add (add)
          2 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 1;
            RegW = 1;
          end

          //and (and)
          3 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //xor (xor)
          4 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 2;
            RegW = 1;
          end

          //copy (cpy)
          5 : begin
            branch = 0;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 1;
            ALUOp = 0;
            RegW = 1;
          end

          //shift logical (sl)
          6 : begin
            branch = 0;
            load = 0;
            shift = 1;
            MemR = 0;
            copy = 0;
            ALUOp = 0;
            RegW = 1;
          end

          //branch not equal (bne)
          7 : begin
            branch = 1;
            load = 0;
            shift = 0;
            MemR = 0;
            copy = 0;
            ALUOp = 3;
            RegW = 0;
          end
      end
endmodule
/*    case(Opcode)
      // Load Immediate (li)
      0 : begin
        ALUOp = kREST;
        RegWrite = 1;
        IncReg = 0;
        ClearReg = 0;
        OvToReg = 0;
        LoadImm = 1;
        WriteValSel = 2'd1;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd0;
        OvWrite = 0;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end

      // R1 Types - Opcode = 001
      1 : begin
        case(Funct)
          // Clear Register (clr) - Funct = 000
          0 : begin
            ALUOp = kREST;
            RegWrite = 1;
            ClearReg = 1;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Increment Register (inc) - Funct = 001
          1 : begin
            ALUOp = kREST;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 1;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Shift Logical Left (sll) - Funct = 010
          2 : begin
            ALUOp = kSLL;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd2;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Shift Right Logical (srl) - Funct = 011
          3 : begin
            ALUOp = kSRL;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd2;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Two's Complement (twcmp) - Funct = 100ns
          4 : begin
            ALUOp = kTWCMP;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd2;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Halt (halt) - Funct = 101
          5 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 1;
          end
          // Load Word (lw) - Funct = 110
          6 : begin
            ALUOp = kREST;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd2;
            MemRead = 1;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Store Word (sw) - Funct = 111
          7 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd2;
            MemRead = 0;
            MemWrite = 1;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Default Case - Do Nothing
          default : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
        endcase
      end

      // R1 Types - Opcode = 010
      2 : begin
        case(Funct)
          // Branch (br) - Funct = 000
          0 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 1;
            BranchCond = 0;
            Halt = 0;
          end
          // Branch Equal Zero (bez) - Funct = 001
          1 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 1;
            Halt = 0;
          end
          // Check & Set LSB (clsb) - Funct = 010
          2 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Get & Set Overflow (getov) - Funct = 011
          3 : begin
            ALUOp = kREST;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 1;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Pattern Check (patr) - Funct = 100
          4 : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd1;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Absolute Value (abs) - Funct = 101
          5 : begin
            ALUOp = kABS;
            RegWrite = 1;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Absolute Value (abs) - Funct = 101
          6 : begin
            ALUOp = kSLTU;
            RegWrite = 0;
            IncReg = 0;
            ClearReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd2;
            OvWrite = 1;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
          // Default Case - Do Nothing
          default : begin
            ALUOp = kREST;
            RegWrite = 0;
            ClearReg = 0;
            IncReg = 0;
            OvToReg = 0;
            LoadImm = 0;
            WriteValSel = 2'd0;
            MemRead = 0;
            MemWrite = 0;
            OvSel = 2'd0;
            OvWrite = 0;
            Branch = 0;
            BranchCond = 0;
            Halt = 0;
          end
        endcase
      end

      // Add (add) - Opcode = 011
      3 : begin
        ALUOp = kADD;
        RegWrite = 1;
        IncReg = 0;
        ClearReg = 0;
        OvToReg = 0;
        LoadImm = 0;
        WriteValSel = 2'd0;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd2;
        OvWrite = 1;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end

      // Subtract (sub) - Opcode = 100
      4 : begin
          ALUOp = kSUB;
          RegWrite = 1;
          IncReg = 0;
          ClearReg = 0;
          OvToReg = 0;
          LoadImm = 0;
          WriteValSel = 2'd0;
          MemRead = 0;
          MemWrite = 0;
          OvSel = 2'd2;
          OvWrite = 1;
          Branch = 0;
          BranchCond = 0;
          Halt = 0;
      end

      // Bitwise And (and) - OpCode = 101
      5 : begin
        ALUOp = kAND;
        RegWrite = 1;
        IncReg = 0;
        ClearReg = 0;
        OvToReg = 0;
        LoadImm = 0;
        WriteValSel = 2'd0;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd0;
        OvWrite = 0;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end

      // Bitwise Or (or) - Opcode = 110
      6 : begin
        ALUOp = kOR;
        RegWrite = 1;
        IncReg = 0;
        ClearReg = 0;
        OvToReg = 0;
        LoadImm = 0;
        WriteValSel = 2'd0;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd2;
        OvWrite = 1;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end

      // Set Less Than (slt) - Opcode = 111
      7 : begin
        ALUOp = kSLT;
        RegWrite = 0;
        IncReg = 0;
        ClearReg = 0;
        OvToReg = 0;
        LoadImm = 0;
        WriteValSel = 2'd0;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd2;
        OvWrite = 1;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end

      // Default Case - Do Nothing
      default : begin
        ALUOp = kREST;
        RegWrite = 0;
        ClearReg = 0;
        IncReg = 0;
        OvToReg = 0;
        LoadImm = 0;
        WriteValSel = 2'd0;
        MemRead = 0;
        MemWrite = 0;
        OvSel = 2'd0;
        OvWrite = 0;
        Branch = 0;
        BranchCond = 0;
        Halt = 0;
      end
    endcase
  end
endmodule
*/

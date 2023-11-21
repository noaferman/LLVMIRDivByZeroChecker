#include "DivZeroAnalysis.h"
#include "Utils.h"

namespace dataflow {

//===----------------------------------------------------------------------===//
// DivZero Analysis Implementation
//===----------------------------------------------------------------------===//

/**
 * PART 1
 * 1. Implement "check" that checks if a given instruction is erroneous or not.
 * 2. Implement "transfer" that computes the semantics of each instruction.
 *    This means that you have to complete "eval" function, too.
 *
 * PART 2
 * 1. Implement "doAnalysis" that stores your results in "InMap" and "OutMap".
 * 2. Implement "flowIn" that joins the memory set of all incoming flows.
 * 3. Implement "flowOut" that flows the memory set to all outgoing flows.
 * 4. Implement "join" to union two Memory objects, accounting for Domain value.
 * 5. Implement "equal" to compare two Memory objects.
 */

bool DivZeroAnalysis::check(Instruction *Inst) {
  if (BinaryOperator *BO = dyn_cast<BinaryOperator>(Inst)) {
    // I is a BinaryOperator, do something
    unsigned op_code = BO->getOpcode();
    if(op_code != Instruction::UDiv && op_code != Instruction::SDiv) return false;

    llvm::Value *divisor = BO->getOperand(1);
    Domain *domain_of_divisor =  getOrExtract(InMap[Inst], divisor);

    
    return Domain::equal(*domain_of_divisor, Domain::MaybeZero) || Domain::equal(*domain_of_divisor, Domain::Zero);
  }
  
 return false;
}


bool DivZeroAnalysis::runOnFunction(Function &F) {
  outs() << "Running " << getAnalysisName() << " on " << F.getName() << "\n";

  // Initializing InMap and OutMap.
  for (inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter) {
    auto Inst = &(*Iter);
    InMap[Inst] = new Memory;
    OutMap[Inst] = new Memory;
  }

  // The chaotic iteration algorithm is implemented inside doAnalysis().
  doAnalysis(F);

  // Check each instruction in function F for potential divide-by-zero error.
  for (inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter) {
    auto Inst = &(*Iter);
    if (check(Inst))
      ErrorInsts.insert(Inst);
  }

  printMap(F, InMap, OutMap);
  outs() << "Potential Instructions by " << getAnalysisName() << ": \n";
  for (auto Inst : ErrorInsts) {
    llvm::DebugLoc DebugLoc = Inst->getDebugLoc();
    if (DebugLoc) {
      int Line = DebugLoc.getLine();
      int Col = DebugLoc.getCol();
      outs() << "Possible bug on Line: " << Line << ",  Col:" << Col << "\n";
    } else{
        outs() << "No Debug info \n";
    }
    outs() << "Corresponding LLVM IR Instruction:" << *Inst << "\n";
  }

  for (auto Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter) {
    delete InMap[&(*Iter)];
    delete OutMap[&(*Iter)];
  }
  return false;
}

char DivZeroAnalysis::ID = 1;
static RegisterPass<DivZeroAnalysis> X("DivZero", "Divide-by-zero Analysis",
                                       false, false);
} // namespace dataflow

#include "DivZeroAnalysis.h"
#include "Utils.h"

namespace dataflow {

/**
 * @brief Is the given instruction a user input?
 *
 * @param Inst The instruction to check.
 * @return true If it is a user input, false otherwise.
 */
bool isInput(Instruction *Inst) {
  if (auto Call = dyn_cast<CallInst>(Inst)) {
    if (auto Fun = Call->getCalledFunction()) {
      return (Fun->getName().equals("getchar") ||
              Fun->getName().equals("fgetc"));
    }
  }
  return false;
}

/**
 * Evaluate a PHINode to get its Interval.
 *
 * @param Phi PHINode to evaluate
 * @param InMem InMemory of Phi
 * @return Interval of Phi
 */
Interval *eval(PHINode *Phi, const Memory *InMem) {
  if (auto ConstantVal = Phi->hasConstantValue()) {
    int min = 0;
    int max = 0;
    extractFromValue(ConstantVal, &min, &max);
    return new Interval(min, max);
  }

  Interval *Joined = new Interval();

  for (unsigned int i = 0; i < Phi->getNumIncomingValues(); i++) {
    auto Dom = getOrExtract(InMem, Phi->getIncomingValue(i));
    Joined = Interval::join(Joined, Dom);
  }
  return Joined;
}

/**
 * @brief Evaluate the +, -, * and / BinaryOperator instructions
 * using the Interval of its operands and return the Interval of the result.
 *
 * @param BinOp BinaryOperator to evaluate
 * @param InMem InMemory of BinOp
 * @return Interval of BinOp
 */
Interval *eval(BinaryOperator *BinOp, const Memory *InMem) {
  unsigned op_code = BinOp->getOpcode();
  Interval* left = getOrExtract(InMem, BinOp->getOperand(0));
  Interval* right = getOrExtract(InMem, BinOp->getOperand(1));

  if(op_code == Instruction::Add || op_code == Instruction::FAdd){
    return Interval::add(left, right);
  } else if(op_code == Instruction::Sub || op_code == Instruction::FSub){
    return Interval::sub(left, right);
  } else if(op_code == Instruction::Mul || op_code == Instruction::FMul){
    return Interval::mul(left, right);
  } else if(op_code == Instruction::UDiv || op_code == Instruction::SDiv || op_code == Instruction::FDiv){
    return Interval::mul(left, right);
  } 

  return NULL;
}

/**
 * @brief Evaluate Cast instructions.
 *
 * @param Cast Cast instruction to evaluate
 * @param InMem InMemory of Instruction
 * @return Interval of Cast
 */
Interval *eval(CastInst *Cast, const Memory *InMem) {
  Value* left_operator = Cast->getOperand(0);
  return getOrExtract(InMem, left_operator);
}

/**
 * @brief Evaluate the ==, !=, <, <=, >=, and > Comparision operators using
 * the Interval of its operands to compute the Interval of the result.
 *
 * @param Cmp Comparision instruction to evaluate
 * @param InMem InMemory of Cmp
 * @return Interval of Cmp
 */
Interval *eval(CmpInst *Cmp, const Memory *InMem) {
  CmpInst::Predicate opr=Cmp->getPredicate();
  Interval* left = getOrExtract(InMem, Cmp->getOperand(0));
  Interval* right = getOrExtract(InMem, Cmp->getOperand(1));


  if(opr == CmpInst::Predicate::ICMP_EQ){
    if(Interval::equal(*left, *right)) return left;
  } else if (opr == CmpInst::Predicate::ICMP_SLT){
    return new Interval();
    //  return new Interval(INT_MIN, left->max);
  }

  // TODO: Come back and add other operators.
  return new Interval();
}

void DivZeroAnalysis::transfer(Instruction *Inst, const Memory *In,
                               Memory &NOut) { 
  if (isInput(Inst)) {
    // The instruction is a user controlled input, it can have any value.
    NOut[variable(Inst)] = new Interval();
  } else if (auto Phi = dyn_cast<PHINode>(Inst)) {
    // Evaluate PHI node
    NOut[variable(Phi)] = eval(Phi, In);
  } else if (auto BinOp = dyn_cast<BinaryOperator>(Inst)) {
    // Evaluate BinaryOperator
    NOut[variable(BinOp)] = eval(BinOp, In);
  } else if (auto Cast = dyn_cast<CastInst>(Inst)) {
    // Evaluate Cast instruction
    NOut[variable(Cast)] = eval(Cast, In);
  } else if (auto Cmp = dyn_cast<CmpInst>(Inst)) {
    // Evaluate Comparision instruction
    NOut[variable(Cmp)] = eval(Cmp, In);
  } else if (auto Alloca = dyn_cast<AllocaInst>(Inst)) {
    // Used for the next iteration, do nothing here.
  } else if (auto Store = dyn_cast<StoreInst>(Inst)) {
    // Used for the next iteration, do nothing here.
  } else if (auto Load = dyn_cast<LoadInst>(Inst)) {
    // Used for the next iteration, do nothing here.
  } else if (auto Branch = dyn_cast<BranchInst>(Inst)) {
    // Analysis is flow-insensitive, so do nothing here.
  } else if (auto Call = dyn_cast<CallInst>(Inst)) {
    // Analysis is intra-procedural, so do nothing here.
  } else if (auto Return = dyn_cast<ReturnInst>(Inst)) {
    // Analysis is intra-procedural, so do nothing here.
  } else {
    errs() << "Unhandled instruction: " << *Inst << "\n";
  }
}

} // namespace dataflow
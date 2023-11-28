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
 * Evaluate a PHINode to get its Domain.
 *
 * @param Phi PHINode to evaluate
 * @param InMem InMemory of Phi
 * @return Domain of Phi
 */
Domain *eval(PHINode *Phi, const Memory *InMem) {
  if (auto ConstantVal = Phi->hasConstantValue()) {
    int min = 0;
    int max = 0;
    Domain::Element element = extractFromValue(ConstantVal, &min, &max);
    return new Domain(element, min, max);
  }

  Domain *Joined = new Domain(Domain::Uninit);

  for (unsigned int i = 0; i < Phi->getNumIncomingValues(); i++) {
    auto Dom = getOrExtract(InMem, Phi->getIncomingValue(i));
    Joined = Domain::join(Joined, Dom);
  }
  return Joined;
}

/**
 * @brief Evaluate the +, -, * and / BinaryOperator instructions
 * using the Domain of its operands and return the Domain of the result.
 *
 * @param BinOp BinaryOperator to evaluate
 * @param InMem InMemory of BinOp
 * @return Domain of BinOp
 */
Domain *eval(BinaryOperator *BinOp, const Memory *InMem) {
  unsigned op_code = BinOp->getOpcode();
  Domain* domain_left = getOrExtract(InMem, BinOp->getOperand(0));
  Domain* domain_right = getOrExtract(InMem, BinOp->getOperand(1));

  if(op_code == Instruction::Add || op_code == Instruction::FAdd){
    return Domain::add(domain_left, domain_right);
  } else if(op_code == Instruction::Sub || op_code == Instruction::FSub){
    return Domain::sub(domain_left, domain_right);
  } else if(op_code == Instruction::Mul || op_code == Instruction::FMul){
    return Domain::mul(domain_left, domain_right);
  } else if(op_code == Instruction::UDiv || op_code == Instruction::SDiv || op_code == Instruction::FDiv){
    return Domain::mul(domain_left, domain_right);
  } 

  return NULL;
}

/**
 * @brief Evaluate Cast instructions.
 *
 * @param Cast Cast instruction to evaluate
 * @param InMem InMemory of Instruction
 * @return Domain of Cast
 */
Domain *eval(CastInst *Cast, const Memory *InMem) {
  Value* left_operator = Cast->getOperand(0);
  return getOrExtract(InMem, left_operator);
}

/**
 * @brief Evaluate the ==, !=, <, <=, >=, and > Comparision operators using
 * the Domain of its operands to compute the Domain of the result.
 *
 * @param Cmp Comparision instruction to evaluate
 * @param InMem InMemory of Cmp
 * @return Domain of Cmp
 */
Domain *eval(CmpInst *Cmp, const Memory *InMem) {
  CmpInst::Predicate opr=Cmp->getPredicate();
  Domain* domain_left = getOrExtract(InMem, Cmp->getOperand(0));
  Domain* domain_right = getOrExtract(InMem, Cmp->getOperand(1));


  if(opr == CmpInst::Predicate::ICMP_EQ){
    if(Domain::equal(*domain_left, *domain_right)) return domain_left;
  } 
  
  // TODO: How to deal with the while loop flipping this.
   else if (opr == CmpInst::Predicate::ICMP_SLT){
      outs() << "left: "; 
      domain_left->print(outs());
      outs() << "\n" ;
      domain_right->print(outs());
      outs() << "\n" ;
    if(domain_left->Value == Domain::Interval){
      return new Domain(Domain::Interval, INT_MIN, domain_left->interval_max);
    }
  }



  // TODO: Come back and add other operators.

  return new Domain(Domain::Uninit);
}

void DivZeroAnalysis::transfer(Instruction *Inst, const Memory *In,
                               Memory &NOut) {

  for(auto& [key, value] : *In){
    outs()<< "key, value:" << key << ", ";
    value->print(outs());
    outs() << "\n";
  }
           
  if (isInput(Inst)) {
    // The instruction is a user controlled input, it can have any value.
    outs() << "Inst input" << '\n';
    NOut[variable(Inst)] = new Domain(Domain::Uninit);
  } else if (auto Phi = dyn_cast<PHINode>(Inst)) {
    outs() << "Inst Phi" << "\n" << "\n";
    // Evaluate PHI node
    NOut[variable(Phi)] = eval(Phi, In);
  } else if (auto BinOp = dyn_cast<BinaryOperator>(Inst)) {
    // Evaluate BinaryOperator
    outs() << "Inst BinOp" << '\n';
    NOut[variable(BinOp)] = eval(BinOp, In);
  } else if (auto Cast = dyn_cast<CastInst>(Inst)) {
    // Evaluate Cast instruction
    outs() << "Inst Cast" << '\n';
    NOut[variable(Cast)] = eval(Cast, In);
  } else if (auto Cmp = dyn_cast<CmpInst>(Inst)) {
    // Evaluate Comparision instruction
    outs() << "Inst CMP" << '\n';
    NOut[variable(Cmp)] = eval(Cmp, In);
  } else if (auto Alloca = dyn_cast<AllocaInst>(Inst)) {
    // Used for the next lab, do nothing here.
  } else if (auto Store = dyn_cast<StoreInst>(Inst)) {
    // Used for the next lab, do nothing here.
  } else if (auto Load = dyn_cast<LoadInst>(Inst)) {
    // Used for the next lab, do nothing here.
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
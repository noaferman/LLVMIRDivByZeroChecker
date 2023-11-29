#include "DivZeroAnalysis.h"
#include "Utils.h"

namespace dataflow {

/**
 * @brief Get the Predecessors of a given instruction in the control-flow graph.
 *
 * @param Inst The instruction to get the predecessors of.
 * @return Vector of all predecessors of Inst.
 */
std::vector<Instruction *> getPredecessors(Instruction *Inst) {
  std::vector<Instruction *> Ret;
  auto Block = Inst->getParent();
  for (auto Iter = Block->rbegin(), End = Block->rend(); Iter != End; ++Iter) {
    if (&(*Iter) == Inst) {
      ++Iter;
      if (Iter != End) {
        Ret.push_back(&(*Iter));
        return Ret;
      }
      for (auto Pre = pred_begin(Block), BE = pred_end(Block); Pre != BE;
           ++Pre) {
        Ret.push_back(&(*((*Pre)->rbegin())));
      }
      return Ret;
    }
  }
  return Ret;
}

/**
 * @brief Get the successors of a given instruction in the control-flow graph.
 *
 * @param Inst The instruction to get the successors of.
 * @return Vector of all successors of Inst.
 */
std::vector<Instruction *> getSuccessors(Instruction *Inst) {
  std::vector<Instruction *> Ret;
  auto Block = Inst->getParent();
  for (auto Iter = Block->begin(), End = Block->end(); Iter != End; ++Iter) {
    if (&(*Iter) == Inst) {
      ++Iter;
      if (Iter != End) {
        Ret.push_back(&(*Iter));
        return Ret;
      }
      for (auto Succ = succ_begin(Block), BS = succ_end(Block);
           Succ != BS; ++Succ) {
        Ret.push_back(&(*((*Succ)->begin())));
      }
      return Ret;
    }
  }
  return Ret;
}

/**
 * @brief Joins two Memory objects (Mem1 and Mem2), accounting for Interval
 * values.
 *
 * @param Mem1 First memory.
 * @param Mem2 Second memory.
 * @return The joined memory.
 */
Memory *join(Memory *Mem1, Memory *Mem2) {
  Memory *MemRes = new Memory();

  // If instruction is in Mem1, but not M2 add it.
  // If instruction is in both, join val of Mem1[var], and Mem2[var]
  for(auto& kv_pair : *Mem1){
    std::string key = kv_pair.first;
    Interval *value = kv_pair.second;

    if(Mem2->find(key) == Mem2->end()){
      // add to Mem2
      (*MemRes)[key] = value;
    } else{
      // join
      (*MemRes)[key] = Interval::join(value, (*Mem2)[key]);
    }
  }

  // Now, we check if there is a vartiable in Mem2 not in Mem1
  for(auto& kv_pair : *Mem2){
    std::string key = kv_pair.first;
    Interval *value = kv_pair.second;

    if(Mem1->find(key) == Mem1->end()){
      // add to Mem2
      (*MemRes)[key] = value;
    }
  }

  return MemRes;
}

void DivZeroAnalysis::flowIn(Instruction *Inst, Memory *InMem) {
  std::vector<Instruction *> preds = getPredecessors(Inst);

  for(auto& pred: preds){
    Memory* OutMem = OutMap[pred];
    InMem = join(InMem, OutMem);
  }

  InMap[Inst] = InMem;
}

/**
 * @brief This function returns true if the two memories Mem1 and Mem2 are
 * equal.
 *
 * @param Mem1 First memory
 * @param Mem2 Second memory
 * @return true if the two memories are equal, false otherwise.
 */
bool equal(Memory *Mem1, Memory *Mem2) {
  for(auto& kv_pair : *Mem1){
    std::string key = kv_pair.first;
    Interval *value = kv_pair.second;

    if(Mem2->find(key) == Mem2->end()){
      // doesn't exist in both
      return false;
    } else{
      // check for equality
      if(!Interval::equal(*value, *(*Mem2)[key])) return false;
    }
  }

  // At this point, we know all the Intervals are equal for the variables that are in both memories.
  // So, if Mem2 has an element that is not in Mem1 we return false.
  // No need to check equality again.
  for(auto& kv_pair : *Mem2){
    std::string key = kv_pair.first;
    Interval *value = kv_pair.second;

    if(Mem1->find(key) == Mem1->end()){
      // doesn't exist in both
      return false;
    }
  }

  return true;
}

void DivZeroAnalysis::flowOut(Instruction *Inst, Memory *Pre, Memory *Post,
                              SetVector<Instruction *> &WorkSet) {
  if(!equal(Pre, Post)){
    std::vector<Instruction *> sucessors = getSuccessors(Inst);
    for (auto& sucessor : sucessors){
      WorkSet.insert(sucessor);
    }
  }
  OutMap[Inst] = Post;
}

void DivZeroAnalysis::doAnalysis(Function &F) {
  SetVector<Instruction *> WorkSet;
  
  for (inst_iterator Iter = inst_begin(F), End = inst_end(F); Iter != End; ++Iter) {
    auto Inst = &(*Iter);
    WorkSet.insert(Inst);
  }

  while(!WorkSet.empty()){
    // pop instruction
    Instruction *Inst = WorkSet.front();
    WorkSet.remove(Inst);
    
    flowIn(Inst, InMap[Inst]);
    Memory *Pre = OutMap[Inst];
    Memory *NewMem = new Memory;
    transfer(Inst, InMap[Inst], *NewMem);

    Memory *Post = new Memory;
    for(auto& kv_pair : *InMap[Inst]){
      std::string key = kv_pair.first;
      Interval *value = kv_pair.second;

      if(NewMem->find(key) == NewMem->end()){
         (*Post)[key] = value;
      }
    }

    for(auto& kv_pair : *NewMem){
      std::string key = kv_pair.first;
      Interval *value = kv_pair.second;
      (*Post)[key] = value;
    }

    flowOut(Inst, Pre, Post, WorkSet);
  }
}

} // namespace dataflow
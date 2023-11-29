#include "Utils.h"
#include "DivZeroAnalysis.h"
#include "Interval.h"
#include "llvm/IR/Constants.h"

const char *WHITESPACES = " \t\n\r";
const size_t VARIABLE_PADDED_LEN = 8;

template <typename V, typename K, class Map, class DefaultConstructor>
V getOrDefault(const Map *M, const K &Key, DefaultConstructor Default) {
  const auto It = M->find(Key);
  if (It == M->end())
    return Default();

  return It->second;
}

namespace dataflow {

std::string variable(const Value *Val) {
  std::string Code;
  raw_string_ostream SS(Code);
  Val->print(SS);
  Code.erase(0, Code.find_first_not_of(WHITESPACES));
  auto RetVal = Code.substr(0, Code.find_first_of(WHITESPACES));
  if (RetVal == "ret" || RetVal == "br" || RetVal == "store") {
    return Code;
  }
  if (RetVal == "i1" || RetVal == "i8" || RetVal == "i32" || RetVal == "i64") {
    RetVal = Code;
  }
  for (auto i = RetVal.size(); i < VARIABLE_PADDED_LEN; i++) {
    RetVal += " ";
  }
  return RetVal;
}

void extractFromValue(const Value *Val, int* min, int* max) {
 if (auto ConstVal = dyn_cast<ConstantData>(Val)) {
    if (ConstVal->isZeroValue()){
      *min = MIN_INT;
      *max = MAX_INT;
      return;
  }
 }

  *min = INT_MIN;
  *max = INT_MAX;
}

Interval *getOrExtract(const Memory *Mem, const Value *Val) {
  return getOrDefault<Interval *>(Mem, variable(Val), [&V = Val] {
    int min = MIN_INT;
    int max = MAX_INT;
    extractFromValue(V, &min, &max);
    return new Interval(min, max);
  });
}

void printMemory(const Memory *Mem) {
  for (auto Iter = Mem->begin(), End = Mem->end(); Iter != End; ++Iter) {
    errs() << "    [ " << Iter->first << " |-> " << *Iter->second << " ]\n";
  }
  if (Mem->empty()) {
    errs() << "\n";
  }
}

void printInstructionTransfer(Instruction *Inst, const Memory *InMem,
                              const Memory *OutMem) {
  auto InState = getOrExtract(InMem, Inst);
  auto OutState = getOrExtract(OutMem, Inst);

  errs() << variable(Inst) << ":\t[ " << *InState << " --> " << *OutState
         << " ]\n";
}

void printMap(Function &F, ValueMap<Instruction *, Memory *> &InMap,
              ValueMap<Instruction *, Memory *> &OutMap) {
  errs() << "Dataflow Analysis Results:\n";
  for (inst_iterator Iter = inst_begin(F), E = inst_end(F); Iter != E; ++Iter) {
    auto Inst = &(*Iter);
    errs() << "Instruction: " << *Inst << "\n";
    errs() << "In set: \n";
    auto InMem = InMap[Inst];
    printMemory(InMem);
    errs() << "Out set: \n";
    auto OutMem = OutMap[Inst];
    printMemory(OutMem);
    errs() << "\n";
  }
}

} // namespace dataflow
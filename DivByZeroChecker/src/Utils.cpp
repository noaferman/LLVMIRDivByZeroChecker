#include "Utils.h"
#include "DivZeroAnalysis.h"
#include "Domain.h"
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

Domain::Element extractFromValue(const Value *Val, int* min, int* max) {
  if (dyn_cast<UndefValue>(Val)) {
    return Domain::Top;
  } else if (auto ConstVal = dyn_cast<ConstantData>(Val)) {
    if (ConstVal->isZeroValue()){
      return Domain::Interval; // the interval will just be 0s
    } else{
     return Domain::Uninit;
    } 
  }
  return Domain::Uninit;
}

Domain *getOrExtract(const Memory *Mem, const Value *Val) {
  return getOrDefault<Domain *>(Mem, variable(Val), [&V = Val] {
    // will get default inited to 0 anyways 
    int min = 0;
    int max = 0;
    Domain::Element element = extractFromValue(V, &min, &max);
    return new Domain(element, min, max);
  });

  return NULL;
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
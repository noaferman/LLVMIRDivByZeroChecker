#ifndef UTILS_H
#define UTILS_H

#include "DivZeroAnalysis.h"

extern const char *WHITESPACES;

namespace dataflow {

/**
 * @brief Get a human-readable string name for an llvm Value
 *
 * @param Val The llvm Value to get the string representation of
 * @return std::string The string representation of Val.
 */
std::string variable(const Value *Val);

/**
 * @brief Try to extract the Domain of a value.
 *
 * When Val is a ConstantInt, we can check if it is non-zero.
 * If so, we set the interval to [0, 0]
 * Otherwise, to top.
 *

 * @param Val Value to extract the Interval for.
 * min and max are output paramaters for the interval range.
 */
void extractFromValue(const Value *Val, int* min, int* max);

/**
 * @brief Get the Interval of Val from Memory Or try Extracting it.
 *
 * @param Mem Memory containing the domain of Val.
 * @param Val Value whose domain is to be extracted from Mem.
 */
Interval *getOrExtract(const Memory *Mem, const Value *Val);

/**
 * @brief Print the Memorm Mem in a human readable format to stderr.
 *
 * Format:
 *   [ <variable1> |-> <domain1> ]
 *   [ <variable2> |-> <domain2> ]
 *  ...
 *
 * @param Mem Memory to print
 */
void printMemory(const Memory *Mem);

/**
 * @brief Print the Before and After Intervals of an instruction
 * wrt. In and Out memory.
 *
 * Format:
 *   <instruction>:    [ <before> --> <after> ]
 *
 * @param Inst The instruction to print the Intervals for.
 * @param InMem The incoming memory.
 * @param OutMem The outgoing memory.
 */
void printInstructionTransfer(Instruction *Inst, const Memory *InMem,
                              const Memory *OutMem);

/**
 * @brief Print the In and Out memory of every instruction in function F to
 * stderr.
 *
 * This gives the human-readable representaion of the results of dataflow
 * analysis.
 *
 * @param F Function whose dataflow analysis result to print.
 * @param InMap Map of In memory of every instruction in function F.
 * @param OutMap Map of Out memory of every instruction in function F.
 */
void printMap(Function &F, ValueMap<Instruction *, Memory *> &InMap,
              ValueMap<Instruction *, Memory *> &OutMap);

} // namespace dataflow

#endif // UTILS_H
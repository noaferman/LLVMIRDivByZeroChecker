#ifndef Interval_H
#define Interval_H

#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define MIN_INT -2147483648   
#define MAX_INT 2147483647   

namespace dataflow {

//===----------------------------------------------------------------------===//
// Abstract Interval Implementation
//===----------------------------------------------------------------------===//

/*
 * Implement your abstract Interval.
 */
class Interval {
public:
  // Top is Interval with {INT_MIN, INT_MAX} range.
  Interval();
  Interval(int min, int max);

  int min;
  int max;

  static Interval *add(Interval *E1, Interval *E2);
  static Interval *sub(Interval *E1, Interval *E2);
  static Interval *mul(Interval *E1, Interval *E2);
  static Interval *div(Interval *E1, Interval *E2);
  static Interval *join(Interval *E1, Interval *E2);
  static bool equal(Interval E1, Interval E2);
  void print(raw_ostream &O);
};

raw_ostream &operator<<(raw_ostream &O, Interval D);

} // namespace dataflow

#endif // Interval_H

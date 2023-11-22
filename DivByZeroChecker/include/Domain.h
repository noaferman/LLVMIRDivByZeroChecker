#ifndef DOMAIN_H
#define DOMAIN_H

#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace dataflow {

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

/*
 * Implement your abstract domain.
 */
class Domain {
public:
  // Top [MIN_INTEGER, MAX_INTEGER]
  // Bottom is Uninit
  enum Element {Uninit, Interval, Top};
  Domain();
  Domain(Element V);
  Domain(Element V, int interval_min, int interval_max);

  Element Value;
  int interval_min;
  int interval_max;

  static Domain *add(Domain *E1, Domain *E2);
  static Domain *sub(Domain *E1, Domain *E2);
  static Domain *mul(Domain *E1, Domain *E2);
  static Domain *div(Domain *E1, Domain *E2);
  static Domain *join(Domain *E1, Domain *E2);
  static bool equal(Domain E1, Domain E2);
  void print(raw_ostream &O);
};

raw_ostream &operator<<(raw_ostream &O, Domain D);

} // namespace dataflow

#endif // DOMAIN_H

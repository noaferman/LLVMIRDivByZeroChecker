#include "Domain.h"
#include <ostream>

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

#define MIN(a, b) a < b ? a : b;
#define MAX(a, b) a > b ? a : b;

namespace dataflow {

int num = 0;

Domain::Domain() { Value = Uninit; }
Domain::Domain(Element V) { Value = V; }

Domain::Domain(Element V, int interval_min, int interval_max) {
  if(interval_min > interval_max){
    outs() << "min " << interval_min << "max: " << interval_max << '\n';
    // assert(interval_min <= interval_max);
  }

  Value = V; 
  interval_min = interval_min;
  interval_max = interval_max;
}

Domain *Domain::add(Domain *E1, Domain *E2) {
  if (E1->Value == Uninit || E2->Value == Uninit)
    return new Domain(Uninit);
  // Both intervals here
  // sanity check if statement
  if (E1->Value == Interval && E2->Value == Interval){
    int min = E1->interval_min + E2->interval_min;
    int max = E1->interval_max + E2->interval_max;
    return new Domain(Interval, min, max);
  }

  // should never get here
  return new Domain(Uninit);
}

Domain *Domain::sub(Domain *E1, Domain *E2) {
  if (E1->Value == Uninit || E2->Value == Uninit)
    return new Domain(Uninit);
  // Both intervals here
  // sanity check if statement
  if (E1->Value == Interval && E2->Value == Interval){
    int min = E1->interval_min - E2->interval_max;
    int max = E1->interval_max - E2->interval_min;
    return new Domain(Interval, min, max);
  }

  // should never get here
  return new Domain(Uninit);
}

Domain *Domain::mul(Domain *E1, Domain *E2) {
  if (E1->Value == Uninit || E2->Value == Uninit)
    return new Domain(Uninit);
  // Both intervals here
  // sanity check if statement
  if (E1->Value == Interval && E2->Value == Interval){
    int min = E1->interval_min * E2->interval_min;
    int max = E1->interval_max * E2->interval_max;
    return new Domain(Interval, min, max);
  }

  // should never get here
  return new Domain(Uninit);
}

Domain *Domain::div(Domain *E1, Domain *E2) {
  if (E1->Value == Uninit || E2->Value == Uninit)
    return new Domain(Uninit);
  // Both intervals here
  // sanity check if statement
  if (E1->Value == Interval && E2->Value == Interval){
    int min = E1->interval_min / E2->interval_max;
    int max = E1->interval_max / E2->interval_min;
    return new Domain(Interval, min, max);
  }

  // should never get here
  return new Domain(Uninit);
}

Domain *Domain::join(Domain *E1, Domain *E2) {
  outs() << "join" << "\n";
  outs().flush();
  // std::flush outs());
  num++;

  // if(num > 10000000){
  //   return new Domain(Uninit);
  // }

  switch (E1->Value) {
  case Uninit:
    return new Domain(Uninit);
  case Interval:
    switch (E2->Value) {
    case Uninit:
      return new Domain(Uninit);
    case Interval:
      int min = MIN(E1->interval_min, E2->interval_min);
      int max = MAX(E1->interval_max, E2->interval_max);
      return new Domain(Interval, min, max);
    }
  }

  return new Domain(Uninit);
} 

bool Domain::equal(Domain E1, Domain E2) {
  if(E1.Value != E2.Value && E1.Value) return false;
  if(E1.Value == E2.Value && E1.Value == Domain::Uninit){
    return true;
  }

  // both intervals
  if(E1.interval_min == E2.interval_min && E1.interval_max == E2.interval_max){
    return true;
  }

  return false;
}

void Domain::print(raw_ostream &O) {
  switch (Value) {
  case Uninit:
    O << "Uninit   ";
    break;
  case Interval:
    O << "Interval [" << interval_min << ", " << interval_max << "]";
  }
}

raw_ostream &operator<<(raw_ostream &O, Domain D) {
  D.print(O);
  return O;
}

}; // namespace dataflow

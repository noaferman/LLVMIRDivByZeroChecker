#include "Domain.h"

//===----------------------------------------------------------------------===//
// Abstract Domain Implementation
//===----------------------------------------------------------------------===//

namespace dataflow {

Domain::Domain() { Value = Uninit; }
Domain::Domain(Element V) { Value = V; }

Domain::Domain(Element V, int interval_min, int interval_max) {
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
  switch (E1->Value) {
  case Uninit:
    return new Domain(*E2);
  case Interval:
    switch (E2->Value) {
    case Uninit:
      return new Domain(Interval, E1->interval_min, E1->interval_max);
    case Interval:
      int min = E1->interval_min;
      int max = E2->interval_max;
      if(E2->interval_min < E1->interval_min){
        min = E2->interval_min;
      }
      if(E2->interval_max > E1->interval_max){
        max = E2->interval_max;
      }
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

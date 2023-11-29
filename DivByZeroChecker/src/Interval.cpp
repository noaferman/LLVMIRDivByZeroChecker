#include "Interval.h"
#include <ostream>

//===----------------------------------------------------------------------===//
// Abstract Interval Implementation
//===----------------------------------------------------------------------===//

#define MIN(a, b) a < b ? a : b;
#define MAX(a, b) a > b ? a : b;

namespace dataflow {

Interval::Interval(): min(MIN_INT), max (MAX_INT) {}

Interval::Interval(int min_, int max_): min(min_), max(max_) {
  assert(!(min > max));
}

Interval *Interval::add(Interval *E1, Interval *E2) {
  int64_t min = 0;
  int64_t max = 0;
  min = (int64_t)E1->min + (int64_t)E2->min;
  max = (int64_t)E1->max + (int64_t)E2->max;

  // Make the cast down safe (avoid int32_t overflow :)
  if(min < MIN_INT){
    min = MIN_INT;
  }
  if(max > MAX_INT){
    max = MAX_INT;
  }

  return new Interval((int32_t) min, (int32_t) max);
}

Interval *Interval::sub(Interval *E1, Interval *E2) {
  int64_t min = 0;
  int64_t max = 0;
  min = (int64_t)E1->min - (int64_t)E2->max;
  max = (int64_t)E1->max - (int64_t)E2->min;

  // Make the cast down safe (avoid int32_t overflow :)
  if(min < MIN_INT){
    min = MIN_INT;
  }
  if(max > MAX_INT){
    max = MAX_INT;
  }

  return new Interval(min, max);
}

Interval *Interval::mul(Interval *E1, Interval *E2) {
  int64_t min = 0;
  int64_t max = 0;
  min = (int64_t)E1->min * (int64_t)E2->min;
  max = (int64_t)E1->max * (int64_t)E2->max;

  // Make the cast down safe (avoid int32_t overflow :)
  if(min < MIN_INT){
    min = MIN_INT;
  }
  if(max > MAX_INT){
    max = MAX_INT;
  }
  return new Interval((int32_t)min, (int32_t)max);
}

Interval *Interval::div(Interval *E1, Interval *E2) {
  int64_t min = 0;
  int64_t max = 0;
  min = (int64_t)E1->min / (int64_t)E2->max;
  max = (int64_t)E1->max / (int64_t)E2->min;

  // Make the cast down safe (avoid int32_t overflow :)
  if(min < MIN_INT){
    min = MIN_INT;
  }
  if(max > MAX_INT){
    max = MAX_INT;
  }
  return new Interval(min,max);
}

Interval *Interval::join(Interval *E1, Interval *E2) {
  int min = MIN(E1->min, E2->min);
  int max = MAX(E1->max, E2->max);
  return new Interval((int32_t)min, (int32_t)max);
} 

bool Interval::equal(Interval E1, Interval E2) {
  // both must be intervals
  return E1.min == E2.min && E1.max == E2.max;
}

void Interval::print(raw_ostream &O) {
  O << "Interval [" << min << ", " << max << "]";
}

raw_ostream &operator<<(raw_ostream &O, Interval D) {
  D.print(O);
  return O;
}

}; // namespace dataflow

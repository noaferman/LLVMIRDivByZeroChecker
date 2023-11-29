# Div-By-Zero Checker in LLVM IR
This is a divide-by-zero checker, based off of a framework by Dr. Mayur Naik.

To run the interval lattive, use the IntervalLattice Branch.
Otherwise, the Top, Bottom, Zero, Non-Zero lattice is used.

Run LLVMIRDivByZeroChecker/DivByZeroChecker in the provided docker container.

To run our build on all tests:
cd test
make

To run our build on a specific test:
cd test
make <test# as in the .c file>

To build this:
cd build
make

To see the offending lines in code & LLVM IR: Head to <test##>.out


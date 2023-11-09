# Div-By-Zero Checker in LLVM IR
This is a divide-by-zero checker, based off of Dr. Dr. Mayur Naik.

Run /DivByZeroChecker in the provided docker container.

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


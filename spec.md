EE2.14 Language Processors Courswork
====================================

Issued: 23rd Feb
Due:    23rd Mar

Overall goal
------------

The goal of this coursework is to develop
from scratch a compiler from C to ARM assembly,
using C++ as the compiler implementation language.
The compiler should compile under the standard
lab linux install (and hopefully all other C++ environments),
and produce assembly that when assembled and linked
executes correctly on an ARM processor running debian
wheezy (and hopefully all other ARM environments).

Target functionality
--------------------

The functionality of your compiler will be
assessed according to it's ability to handle
C constructs of increasing difficulty:

1. Basic control-flow and expressions: your
   compiler should be able to handle basic C
   programs that consist of sequences of statements
   containing numeric variables, arithmetic operations,
   conditional statements, and printing of results

2. More Advanced Control Flow: the compiler can additionally
   handle loops, procedures and functions

3. More Advanced Data types: the compiler can also handle more
   elaborate data types, including arrays and pointers

Sample inputs are available:

1. Basic: [A_sample1.c](samples/A_sample1.c), [A_sample2.c](samples/A_sample2.c), [A_sample3.c](samples/A_sample3.c)

2. Control-flow: [B_sample4.c](samples/B_sample4.c), [B_sample5.c](samples/B_sample5.c), [B_sample6.c](samples/B_sample6.c)

3. Data-types: [C_sample7.c](samples/C_sample7.c), [C_sample8.c](samples/C_sample8.c)

However, the samples only identify the types of constructs,
and do not represent the set of source files used for testing.

Your compiler should accept the file names of the input
source file and target destination assembly file in the following
format:
```
./bin/compiler -S -o <asm-file.s> <src-file.c>
```
This is designed to be compatible with gcc, but it is
guaranteed that the arguments will _always_ appear in
this order during testing. You are welcome (and encouraged)
to add extra command line options as appropriate.

The target architecture is ARM, little-endian. In terms of
instruction set, you can assume at least ARM9 (though it
really shouldn't matter for what you are doing).

Deliverables
------------

You should submit via blackboard a zip file containing
the following outputs in the given directory structure:

- `./Makefile`: a makefile which supports the following targets:
   
     - `make build` : Builds your compiler
   
     - `make test_compile` : Compiles as many test-cases as possible
     
     - `make test_run` : Actually runs your test-cases
     
     - `make all` : builds everything, and runs testcases     

- `./src/` : The source code for your compiler, including:

  - All source files (C, C++, parser, lexer, ...)
  
  - Any auto-generated source files (parser output, etc.)
  
- `./bin/compiler`: A compiled binary of your compiler, produced on a linux lab machine.
    
- `./test` : A directory containing your test cases

  - `./test/input/*.c` : The C source files you used for testing (this may include
      the examples given, but may include more).

  - `./test/output/*.s`: The assembly output from your compiler
      for as many of your C test-cases as possible.

- `./report.pdf`: A pdf report of _at most_ four pages
  which acts as a guide to the compiler, covering:
  
  - the overall design and structure of your compiler
  
  - a high-level summary of your grammar (not a copy and paste of the Bison input)
  
  - any important design decisions taken
  
  - descriptions of important algorithms or data-structures you used

During the last lab session of term (23rd Mar @ 9:00) you will
be required to give a brief oral demonstrating your compiler
and walking through some of the code. The main purpose of
the oral is to check that you understand the code you have
written, and to uncover an potential build problems.

Assessment
-------------

The marks are allocated as:

- Correctness [55%]

  - Basic control-flow [25%]

  - Advanced control-flow [15%]

  - Advanced data-flow [15%]

- Quality of output [20%]

  - Error reporting [10%]
  
  - Performance [10%]

- Design and engineering [25%]


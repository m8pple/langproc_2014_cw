EE2.14 Language Processors Courswork
====================================

Due:    23rd Mar 9:00 (before lab)

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

Specification
=============

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

1. Basic: [A_sample1.c](samples/A_sample1.c), [A_sample2.c](samples/A_sample2.c), [A_sample3.c](samples/A_sample3.c), [A_sample4.c](samples/A_sample4.c)

2. Control-flow: [B_sample5.c](samples/B_sample5.c), [B_sample6.c](samples/B_sample6.c), [B_sample5.c](samples/B_sample5.c) 

3. Data-types: [C_sample8.c](samples/C_sample8.c), [C_sample9.c](samples/C_sample9.c)

However, the samples only identify the types of constructs,
and do not represent the full set of source files used for testing.

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
   
     - `make test_compile -k` : Compiles as many test-cases as possible (`-k` means "keep going if one command errors).

- `./src/` : The source code for your compiler, including:

  - `./src/Makefile` : a makefile which builds your compiler, ideally including automatic building of lex outputs

  - All source files (C, C++, parser, lexer, ...)
  
  - Any auto-generated source files (parser output, etc.)
  
- `./bin/compiler`: A compiled binary of your compiler, produced on a linux lab machine.
    
- `./test` : A directory containing your test cases

  - `./test/input/*.c` : The C source files you used for testing (this may include
      the examples given, but can include more).

  - `./test/got/*.s`: The assembly output from your compiler
      for as many of your C test-cases as possible (include them in the submission zip)

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
written, and to uncover an potential build problems. Your submission
must have been made before this point.

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


Details
=======

Target Build platform
---------------------

Your target build platform is the standard linux lab
install, with all that implies in terms of C
versions and libraries.

### Target ARM platform

The target platform is linux on little-endian ARM. There
is nothing too special about the platform in terms
of binutils, libc, or linux version, but for completeness
sake, it is:
- debian (wheezy/7 or better)
- GNU binutils (2.22 or better)
- gcc toolchain (4.6.3 or better)
- ARM9 or better CPU 
- make, bash, git, rsync ("modern-ish")

Some of the tools are a little old, but that doesn't
really matter, as it isn't the place where your compiler
needs to run - all you need to do is check that you
can turn the `.s` files into executables and try running
them.

### Shared reference ARM platform

A remote ARM machine is available for testing
purposes, which allows you to login and try executing
programs. Note that the aim is not that you spend
huge amounts of time logged in there, or that you use
it for anything particularly CPU intensive.

The testing platform is explicitly _not_ stable,
and is _not_ persistent. Any files left on the
machine can be expected to be deleted at random
times, the machine may randomly reboot, and there
is no guaranteed uptime (if we get a power cut,
it will not come back up until manually restarted).

The machine is also neither fast nor big, as you'll
be able to see from the amount of memory it has, but
then it doesn't need to be. If you find the machine
particularly slow, you might wish to use `who` to
see how many other people are in there, and `top`
to see if anyone has managed to leave a test program
in a busy wait loop.

The main parameters needed to get to the server are:
- `ARM_HOST` : address of the server
- `ARM_PORT` : port the server is using to host SSH
- `ARM_USER` : your personal login (same as your ICT login)
- `ARM_PASS` : your personal password
- `ARM_KEY`  : Path of your personal private key file

Given those variables, you should be able to do:
- `ssh -p $ARM_PORT $ARM_USER@$ARM_HOST` : Drop you into an SSH session, after typing your password.
- `scp -P $ARM_PORT file(s) $ARM_USER@$ARM_HOST:~` : Copy local files to your home directory on the machine
- `scp -P $ARM_PORT $ARM_USER@$ARM_HOST:~ file(s)` : Copy files from your home directorys on the machine back to local

The key can be used for passwordless authentication:
```
chmod og-rwx $ARM_KEY; # Make sure no-one else can read it
eval `ssh-agent`;      # Set up an agent in the background to manage keys
ssh-add $ARM_KEY;      # Give the key to the agent
```
Once that is setup you can (probably) do ssh and scp
without needing the password each time. However, you
need to protect the key-file (best practises would
be to add a passphrase).

### Private reference platform

I based my reference on [this image](https://people.debian.org/~aurel32/qemu/armel/),
and you can replicate the reference platform on your
own machine by installing QEMU. There are binary
packages for QEMU in most linuxes, and probably
windows too. It can be installed in lab linux
machines, but you have to build from scratch. 

Once you have QEMU installed, you can get the
installation images from within college:
```
wget -N http://cas.ee.ic.ac.uk/people/dt10/teaching/2014/langproc/image/debian_wheezy_armel_standard.qcow2
wget -N http://cas.ee.ic.ac.uk/people/dt10/teaching/2014/langproc/image/initrd.img-3.2.0-4-versatile
wget -N http://cas.ee.ic.ac.uk/people/dt10/teaching/2014/langproc/image/vmlinuz-3.2.0-4-versatile
```
and can then either start the server with a GUI:
```
qemu-system-arm -M versatilepb -kernel ../vmlinuz-3.2.0-4-versatile \
        -initrd ../initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 \
        -redir tcp:55555::22  -append "root=/dev/sda1"
```
or in a headless mode (no GUI, SSH only):
```
qemu-system-arm -display none -daemonize -M versatilepb -kernel ../vmlinuz-3.2.0-4-versatile \
        -initrd ../initrd.img-3.2.0-4-versatile -hda debian_wheezy_armel_standard.qcow2 \
        -redir tcp:55555::22 -append "root=/dev/sda1"
```
In both cases, once the system has started (it may take a while),
you should be able to ssh into it with:
```
ssh -p 55555 root@localhost
```
The default password is... `root`. You'll probably want to
change that, as to anyone who manages to find that port,
they'll just see it as a linux machine with a pathetic
password.

Once you're logged into the ARM machine, you
can `apt-get install gcc` or whatever you like.

### Physical ARM platforms

We do have a number of Raspberry Pi boards,
so if you're interested in trying it out
on bare metal, let Max know and he can help
you get set up. If you already have a Pi,
it is actually a pretty fast way of testing
(you can run both your compiler and the
testing in the same place).

Pre-processor
-------------

You do not need to implement the C pre-processor,
so your input C will already have had all `#include`
and `#define` statements removed. The only thing
that will be left is line numbers explaining where
each line originally came from. We will assume
the use of the GNU pre-processor, and the [specific format](https://gcc.gnu.org/onlinedocs/cpp/Preprocessor-Output.html)
that it produces. The best way of understanding
it is to run the pre-processor and look at the
output.

System header files
-------------------

We'll make use of C library functions for input and
output, which means the use of `#include <stdio.h>`
and such-like. The default system headers contain
a lot of extra implementation specific C, so we will
use cut-down versions, found in [test/include]. To
force their use, you can use the following commands
to cpp:
```
cpp -nostdinc -I include   -o test.i   test.c
```
where `-I include` gives the path to that directory.

However, if your parser can handle the full gamut
of GCC's header files, that is good too.


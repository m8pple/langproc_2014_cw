.PRECIOUS : got/%.s got/%.i %.assemble.log %.link.log %.compile.log

# You are providing the ARM compiler
ARM_CC ?= ../bin/compiler

# Do you have ARM binutils as well?
ARM_AS = 
ARM_GCC = 

###############################
## General rules for building a test-case

got/%.i : input/%.c
	# We use a special include dir to get the simplified stdio.h
	cpp -nostdinc  -I include   -o   got/$*.i   input/$*.c

got/%.s got/%.compile.log :got/%.i
	echo "Compile"
	$(ARM_CC)   -S   -o   got/$*.s   got/$*.i   2>&1  | tee got/$*.compile.log

# These are all things you can do if you set up ARM cross-compilers

#got/%.o got/%.assemble.log : got/%.s
#	$(ARM_AS) -o $@ $<   2>&1  | tee got/$*.assemble.log

#got/%.exe got/%.link.log : got/%.o
#	$(ARM_GCC) -o $@ $<   2>&1  | tee got/$*.link.log

#got/%.input :
#	if [ -e input/$*.input ] ; then cp input/$*.input $@; else echo "" > $@; fi
	
# This can be done with qemu-static if you set it up on your machine. It
# is... lets say kind of useful

#got/%.output : got/%.exe got/%.input
#	cat got/$*.input | got/$*.exe > got/$*.output
	
	
###############################
## Reference rules

ref/%.exe : input/%.c
	$(CC) -o $@ $<

ref/%.input :
	if [ -e ref/$*.input ] ; then cp ref/$*.input $@; else echo "" > $@; fi
	
ref/%.output : ref/%.exe ref/%.input
	cat ref/$*.input | ref/$*.exe > ref/$*.output

###############################

TEST_INPUTS:=$(wildcard input/*.c)
TEST_NAMES:=$(patsubst input/%.c,%,$(TEST_INPUTS))

TEST_ASMS:=$(foreach i,$(TEST_NAMES), got/$(i).s)

build : $(TEST_ASMS)

test : 
	# One observes that if you were to:
	# 1. scp run_all.sh got/*.s and got/*.input to the ARM
	# 2. ssh to the arm, and run ./run_all.sh
	# 3. scp got/*.output and got/*.log back from the ARM
	#then you might have a nice automated test framework

	

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
	
# This can be done with qemu

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


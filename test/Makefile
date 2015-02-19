.PRECIOUS : %.i %.assemble.log %.link.log %.compile.log

COMPILER ?= ../bin/compiler

###############################
## General rules for building a test-case

got/%.i : input/%.c
	# We use a special include dir to get the simplified stdio.h
	cpp -nostdinc  -I include   -o   got/$*.i   input/$*.c

got/%.s got/%.compile.log :got/%.i
	echo "Compile"
	$(COMPILER)   -S   -o   got/$*.s   got/$*.i   2>&1  | tee got/$*.compile.log

got/%.o got/%.assemble.log : got/%.s
	echo "Assemble"
	as -o $@ $<   2>&1  | tee got/$*.assemble.log

got/%.exe got/%.link.log : got/%.o
	gcc -o $@ $<   2>&1  | tee got/$*.link.log

got/%.input :
	if [ -e input/$*.input ] ; then cp input/$*.input $@; else echo "" > $@; fi
	
got/%.output : got/%.exe got/%.input
	cat got/$*.input | got/$*.exe > got/$*.output
	
	
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
TEST_EXES:=$(foreach i,$(TEST_NAMES), got/$(i).s)
TEST_OUTPUTS:=$(foreach i,$(TEST_NAMES), got/$(i).output)

build : $(TEST_ASMS)

run : $(TEST_OUTPUTS)
